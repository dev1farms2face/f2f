from django import template
from home.models import Recipe, MixingAgent, Base, Ingredient, FacePack, CustomFacePack
import pdb

register = template.Library()

@register.inclusion_tag('facepack.html')
def facepack_display(item_id):
    mandatory = []
    type = "primary"
    for cfp in CustomFacePack.objects.filter(facepack=item_id):
        ing = cfp.optional_ingredient if cfp.optional_ingredient else cfp.recipe.mandatory_ingredient
        mandatory.append({
            'name'   : ing.name,
            'id'     : ing.id,
            'r_id'   : cfp.recipe.id,
            'image'  : ing.image,
        })
        if cfp.optional_ingredient:
            type = "secondary"
    fp = FacePack.objects.get(pk=item_id)
    res = {
      'item_id'      : item_id,
      'name'         : fp.name,
      'mandatory'    : mandatory,
      'base'         : fp.base.name,
      'mixing_agent' : fp.mixing_agent.name,
      'type'         : type,
    }
    return {'item': res }
