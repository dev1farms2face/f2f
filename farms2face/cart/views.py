from django.shortcuts import render
from django.http import HttpResponse
from home.models import Recipe, MixingAgent, Base, Ingredient, FacePack, CustomFacePack
from cart.models import Cart
from userregistration.views import init_user_login
from home.views import cart_size, get_name_if_valid_user
from payments.models import Shipping
from decimal import *
import pdb
import json
import random


# Create your views here.

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
                'price'        : '$'+str(c.item.price*c.quantity),
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
        'valid_user'      : get_name_if_valid_user(request),
    }
    return render(request, "cart.html", data)


def update_quantity(request):
    json_response = { 'success': False }
    if request.method == 'POST':
        init_user_login(request)
        user = request.user
        data = json.loads(request.POST['data'])
        cart_id = int(data['cart_id'])
        operation = data['operation']
        c = Cart.objects.get(pk=cart_id)
        if operation == "up":
            c.quantity += 1
        if operation == "down":
            c.quantity -= 1
        c.save()
        json_response['success'] = True
    return HttpResponse(json.dumps(json_response, ensure_ascii=False))

