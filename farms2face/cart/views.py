from django.shortcuts import render, redirect
from django.http import HttpResponse
from home.models import Recipe, MixingAgent, Base, Ingredient, FacePack, CustomFacePack
from cart.models import Cart
from userregistration.views import init_user_login
from home.views import cart_size, get_valid_user_data
from payments.models import *
from userregistration.models import *
from decimal import *
import pdb
import datetime
import json
import random
import stripe
import farms2face.settings as settings


# Create your views here.

def thanks(request):
    data = {
        'cart_size' : cart_size(request),
        'valid_user': get_valid_user_data(request)
    }
    return render(request, "thanks.html", data)

def checkout(request):
    json_response = { 'success': False }
    if request.method == 'POST':
        init_user_login(request)
        user = request.user
        data = json.loads(request.POST['data'])
        shipping_id = data['shipping_id']
        token_id = data['token_id']
        token_id = "tok_visa"
        shipping = Shipping.objects.get(pk=shipping_id)
        # Check for valid payment option
        if hasattr(user, 'cart_set') and shipping:
            total = Decimal('0.00');
            subtotal = Decimal('0.00');
            for c in user.cart_set.all():
                subtotal += c.item.price*c.quantity     
            total = subtotal + shipping.cost
            # 1. make payment
            # Stripe charge code
            ch = None
            payment_type = None
            stripe.api_key = settings.STRIPE_API_KEY
            if hasattr(user, 'paymenttype_set') and user.paymenttype_set.count() > 0:
                # Stripe customer already registered.
                customer_id = user.paymenttype_set.get(user=user).stripe.customer_id
                ch = stripe.Charge.create(
                    amount=int(total*100),
                    currency="usd",
                    description="Charge for "+user.email,
                    customer=customer_id,
                )
                payment_type = user.paymenttype_set.all()[0].stripe
            else:
                # New Stripe account, create charge
                ch = stripe.Charge.create(
                    amount=int(total*100),
                    currency="usd",
                    description="Charge for "+user.email,
                    source = token_id
                )
                # Create Stripe customer object
                cu = stripe.Customer.create(
                    description="Customer "+user.email,
                    email=user.email,
                    source = token_id
                ) 
                # Add a local stripe payment type object
                s = Stripe() 
                s.customer_id = cu.id
                s.user = user
                s.street = data.get('b_addr1', "")
                s.city = data.get('b_city', "")
                s.state = data.get('b_state', "")
                s.country = data.get('b_country', "")
                s.zipcode = data.get('b_zip', "")
                s.primary = True
                s.type = ch.source.brand
                s.created = ch.created
                s.owner_name = data.get('b_name', "")
                s.number = ch.source.last4
                s.expiry = datetime.datetime.strptime(str(ch.source.exp_year)+\
                           "-"+str(ch.source.exp_month), '%Y-%m')
                s.save()
                payment_type = s
                
                # make a local ShippingAddress object
                sh = ShippingAddress()
                sh.profile = user.profile
                names = data.get('b_name', "").split()
                first, last = " ".join(names[0:-1]), names[-1]
                sh.first_name = first
                sh.last_name = last
                sh.street1 = data.get('s_addr1', "") 
                sh.city = data.get('s_city', "") 
                sh.state = data.get('s_state', "") 
                sh.country = data.get('s_country', "") 
                sh.zipcode = data.get('s_zip', "") 
                if ShippingAddress.objects.filter(profile=user.profile, primary=True).count() == 0:
                    sh.primary = True
                    sh.save()
            # Make local payment object based on above charge
            payment = Payment()
            payment.user = user
            payment.type = payment_type
            payment.total = total
            payment.save()
            # 2. record purchase history, while (re)moving entry from cart
            for c in user.cart_set.all():
                ph = PurchaseHistory()
                ph.user = user
                ph.payment = payment
                ph.item = c.item
                ph.shipping = shipping
                ph.type = c.type
                ph.subtype = c.subtype
                ph.quantity = c.quantity
                ph.save()
                c.delete()
            json_response['success'] = True
    return HttpResponse(json.dumps(json_response, ensure_ascii=False))


def view_cart(request):
    data = {}
    #init_user_login(request)
    cart_items = []
    shipping_id = int(request.GET.get('shipping')) if request.GET.get('shipping') else 1
    shipping = Shipping.objects.get(pk=shipping_id)
    subtotal = Decimal('0.00');
    total = Decimal('0.00');
    user = request.user
    if cart_size(request) > 0:
        for c in user.cart_set.all():
            mandatory = []
            optional = None
            for cfp in CustomFacePack.objects.filter(facepack=c.item):
                mandatory.append({
                    'name'   : cfp.recipe.mandatory_ingredient.name,
                    'id'     : cfp.recipe.mandatory_ingredient.id,
                    'r_id'   : cfp.recipe.id,
                    'image'  : cfp.recipe.mandatory_ingredient.image,  
                })
                optional = cfp.optional_ingredient
            fp = FacePack.objects.get(pk=c.item_id)
            cart_items.append({
                'id'           : c.id,
                'type'         : c.type,
                'subtype'      : c.subtype,
                'item_id'      : c.item_id,
                'name'         : fp.name,
                'mandatory'    : mandatory,
                'base'         : fp.base.name,
                'mixing_agent' : fp.mixing_agent.name,
                'optional'     : { 
                                   'name'  : optional.name,
                                   'image' : optional.image,
                                 } if optional else "" ,
                'quantity'     : c.quantity,
                'price'        : '$'+str(c.item.price*c.quantity) if c.type == "buy" else '$'+str(c.item.price)
            })
            subtotal += c.item.price*c.quantity
    data = {
        'cart_size' : cart_size(request),
        'cart_items': cart_items,
        'shipping_items'  : [{ 'type': s.type,
                               'id': s.id } for s in Shipping.objects.all()],
        'shipping_id'     : shipping.id,
        'shipping_cost'   : '$'+str(shipping.cost),
        'shipping_helper' : shipping.helper,
        'subtotal'        : '$'+str(subtotal),
        'total'           : '$'+str(subtotal+shipping.cost) ,
        'total_cents'     : (subtotal+shipping.cost)*100,
        'valid_user'      : get_valid_user_data(request),
        'is_anonymous'    : user.username.startswith("anon_"),
    }
    return render(request, "cart.html", data)


def update_quantity(request):
    json_response = { 'success': False }
    if request.method == 'POST':
        init_user_login(request)
        user = request.user
        data = json.loads(request.POST['data'])
        cart_id = int(data['cart_id'])
        val = data['operation']
        c = Cart.objects.get(pk=cart_id)
        if c.type == "buy":
            if val == "up":
                c.quantity += 1
            if val == "down":
                c.quantity -= 1
            c.item.price = c.item.price_single
        elif c.type == "subscribe":
            if val == "regular":
                c.subtype = "regular"
                c.item.price = c.item.price_regular
                c.item.save()
            elif val == "intense":
                c.subtype = "intense"
                c.item.price = c.item.price_intense
                c.item.save()
        c.save()
        json_response['success'] = True
    return HttpResponse(json.dumps(json_response, ensure_ascii=False))

def update_type(request):
    json_response = { 'success': False }
    if request.method == 'POST':
        init_user_login(request)
        user = request.user
        data = json.loads(request.POST['data'])
        cart_id = int(data['cart_id'])
        c = Cart.objects.get(pk=cart_id)
        c.type = data.get('type', c.type)
        if c.type == 'buy':
            c.subtype = None
            c.item.price = c.item.price_single
            c.item.save()
            c.quantity=1
        if c.type == 'subscribe':
            #c.quantity=4
            c.subtype="regular"
            c.item.price = c.item.price_regular
            c.item.save()
        c.save()
        json_response['success'] = True
    return HttpResponse(json.dumps(json_response, ensure_ascii=False))
