from django.shortcuts import render, get_list_or_404
from django.http import HttpResponse
#from .models import SkinType, SkinConcern, Ingredient, Base, MixingAgent, Recipe, PrePack
from .models import SkinType, SkinConcern, Ingredient, Base, MixingAgent, Recipe 
import json
import random
import pdb

# Create your views here.

def wizard(request):
    #skin_types_all = get_list_or_404(SkinType)
    return render(request, "wizard.html", {})

def results(request):
    return render(request, "results.html", {})

def get_skinconcern_list(request):
    json_response = { 'success': False }
    if request.method == 'GET':
        skin_concerns_all = get_list_or_404(SkinConcern)
        skin_concerns_all = sorted(skin_concerns_all, key=lambda k:k.name)
        json_response = [{'name': s.name, 'id': s.id} for s in skin_concerns_all]
    return HttpResponse(json.dumps(json_response, ensure_ascii=False))

def post_facepacks(request):
    json_response = { 'success': False }
    if request.method == 'POST':
        user = request.user
        data = json.loads(request.POST['data'])
        skintype_id = int(data['skintype_id'])
        skinconcern_ids = map(int, (data['skinconcern_ids']))
        recipes = Recipe.objects.filter(skin_type=skintype_id, skin_concern__in=skinconcern_ids)
        optional_ingr1 = random.choice([x for x in Ingredient.objects.all() if x not in recipes])
        optional_ingr2 = random.choice([x for x in Ingredient.objects.all() \
                                        if x not in recipes and x != optional_ingr1])
        base = random.choice(Base.objects.filter(skin_type=skintype_id))
        mixing_agent = random.choice(MixingAgent.objects.filter(skin_type=skintype_id))
        base_facepack = [base.name]+[mixing_agent.name]+[x.mandatory_ingredient.name for x in recipes]
        facepack_opt_1 = base_facepack+[optional_ingr1.name]
        facepack_opt_2 = base_facepack+[optional_ingr2.name]
        recipe_ids = str(" ".join([str(r.id) for r in recipes]))
        json_response = [
            { "string": base_facepack,
              "base_id": str(base.id),
              "mixing_agent_id": str(mixing_agent.id),
              "optional_id": "0",
              "recipe_ids": recipe_ids },
            { "string": facepack_opt_1,
              "base_id": str(base.id),
              "mixing_agent_id": str(mixing_agent.id),
              "optional_id": str(optional_ingr1.id),
              "recipe_ids": recipe_ids },
            { "string": facepack_opt_2,
              "base_id": str(base.id),
              "mixing_agent_id": str(mixing_agent.id),
              "optional_id": str(optional_ingr2.id),
              "recipe_ids": recipe_ids }
        ] 
    return HttpResponse(json.dumps(json_response, ensure_ascii=False))
    
