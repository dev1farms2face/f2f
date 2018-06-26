from django import template
from home.models import *
from home.views import cart_size, get_valid_user_data
import pdb

register = template.Library()

@register.inclusion_tag('facepack_match.html', takes_context=True)
def facepack_match(context, data):
    # CART CHECK
    #
    # Check whether a current cart item(s) exists that matches an existing facepack entry in DB
    # that matches the ingredient combination, and for the same user.
    # If so then flag this rendered page has items already in cart.
    #
    # FP check 
    request = context['request']
    if cart_size(request) > 0:
        for fp in FacePack.objects.filter(base__id=data['b_id'], mixing_agent__id=data['m_id']):
            if sorted([r['recipe_id'] for r in CustomFacePack.objects.filter(facepack=fp).values('recipe_id')]) == sorted([data['r1_id'], data['r2_id'], data['r3_id']]) and request.user.cart_set.filter(item=fp).count() > 0:
                optional_ingr_set = set([c.optional_ingredient_id for c in CustomFacePack.objects.filter(facepack=fp)])
                cart_type = request.user.cart_set.get(item=fp).type
                if (data['type'] == "primary" and None in optional_ingr_set)\
                  or (data['type'] == "secondary" and set(data['o_ids']) == optional_ingr_set):
                    data['fp'] = fp.id
                    data['fp_type'] = cart_type
    return data
