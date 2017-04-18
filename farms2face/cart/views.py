from django.shortcuts import render, redirect
from django.http import HttpResponse
from home.models import Recipe, MixingAgent, Base, Ingredient, FacePack, CustomFacePack
from cart.models import Cart
from userregistration.views import init_user_login
from home.views import cart_size, get_valid_user_data
from payments.models import *
from decimal import *
import pdb
import json
import random


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
        shipping = Shipping.objects.get(pk=shipping_id)
        # Check for valid payment option
        payment_type = None
        if hasattr(user, 'paymenttype_set') and user.paymenttype_set.count() > 0:
            payment_type = user.paymenttype_set.get(primary=True)
            if hasattr(user, 'cart_set') and payment_type and shipping:
                total = Decimal('0.00');
                subtotal = Decimal('0.00');
                for c in user.cart_set.all():
                    subtotal += c.item.price*c.quantity     
                total = subtotal + shipping.cost
                # 1. make payment
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
                    ph.quantity = c.quantity
                    ph.save()
                    c.delete()
                json_response['success'] = True
    return HttpResponse(json.dumps(json_response, ensure_ascii=False))


def view_cart(request):
    data = {}
    init_user_login(request)
    cart_items = []
    shipping_id = int(request.GET.get('shipping')) if request.GET.get('shipping') else 1
    shipping = Shipping.objects.get(pk=shipping_id)
    subtotal = Decimal('0.00');
    total = Decimal('0.00');
    if cart_size(request) > 0:
        user = request.user
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
        elif c.type == "subscribe":
            if val == "4" or val == "8":
                c.quantity = int(val)
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
            c.quantity=1
        if c.type == 'subscribe':
            c.quantity=4
        c.save()
        json_response['success'] = True
    return HttpResponse(json.dumps(json_response, ensure_ascii=False))
