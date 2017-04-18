from django import template
from home.models import Recipe, MixingAgent, Base, Ingredient, FacePack, CustomFacePack
import pdb

register = template.Library()

@register.inclusion_tag('facepack.html')
def facepack_display(item_id):
    mandatory = []
    optional = None
    for cfp in CustomFacePack.objects.filter(facepack=item_id):
        mandatory.append({
            'name'   : cfp.recipe.mandatory_ingredient.name,
            'id'     : cfp.recipe.mandatory_ingredient.id,
            'r_id'   : cfp.recipe.id,
            'image'  : cfp.recipe.mandatory_ingredient.image,
        })
        optional = cfp.optional_ingredient
    fp = FacePack.objects.get(pk=item_id)
    res = {
      'item_id'      : item_id,
      'name'         : fp.name,
      'mandatory'    : mandatory,
      'base'         : fp.base.name,
      'mixing_agent' : fp.mixing_agent.name,
      'optional'     : { 
                         'name'  : optional.name,
                         'image' : optional.image,
                       } if optional else "" ,
    }
    return {'item': res }
