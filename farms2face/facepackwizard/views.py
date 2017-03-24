from django.shortcuts import render, get_list_or_404
from django.http import HttpResponse
from .models import SkinType, SkinConcern, Ingredient, Base, MixingAgent, Recipe, Option, Question, Questionnaire
import json
import random
import pdb

# Create your views here.

def wizard(request):
    data = [] 
    for q in Question.objects.all():
        data.append({ 
            'id'       : q.id,
            'name'     : q.name,
            'why'      : q.why,
            'multiple' : 'multiple' if q.id == 8 else '',
            'options'  : [{
                            'name':    o['option__name'],
                            'id':      o['option__id'], 
                            'helper':  o['option__helper']
                          } for o in Questionnaire.objects.filter(question=q).\
                          values('option__name','option__id',
                          'option__helper')]
        })
    return render(request, "wizard.html", { 'questions': data })

def wizard_submit(request):
    json_response = { 'success': False }
    if request.method == 'POST':
        data = json.loads(request.POST['data'])
        user = request.user
        skinType = None
        skinConcerns = None
        for d in data:
            if d['id'] == '7':
                skinType = SkinType.objects.get(pk=d['options'][0]);
            if d['id'] == '8':
                skinConcerns = SkinConcern.objects.filter(id__in=d['options'])
        recipes = Recipe.objects.filter(skin_type=skinType, skin_concern__in=skinConcerns)
        optional_ingr1 = random.choice([x for x in Ingredient.objects.all() if x not in recipes])
        optional_ingr2 = random.choice([x for x in Ingredient.objects.all() \
                                        if x not in recipes and x != optional_ingr1])
        base = random.choice(Base.objects.filter(skin_type=skinType))
        mixing_agent = random.choice(MixingAgent.objects.filter(skin_type=skinType))
        json_response = {
            'base'	   : str(base.id),
            'mixing_agent' : str(mixing_agent.id),
            'recipes'      : [str(r.id) for r in recipes],
            'option_1'     : str(optional_ingr1.id),
            'option_2'     : str(optional_ingr2.id),
        } 
    return HttpResponse(json.dumps(json_response, ensure_ascii=False))

def results(request):
    if request and request.method == 'GET':
        recipes = Recipe.objects.filter(id__in=map(int, request.GET.getlist('recipes[]')))
        base = Base.objects.get(pk=request.GET.get('base'))
        mixing_agent = MixingAgent.objects.get(pk=request.GET.get('mixing_agent'))
        option1 = Ingredient.objects.get(pk=request.GET.get('option_1'))
        option2 = Ingredient.objects.get(pk=request.GET.get('option_2'))
        data =  {
            'base': {
                'id': base.id,
                'name': base.name,
                'image': base.image,
                'helper': base.helper 
            },
            'mixing_agent': {
                'id': mixing_agent.id,
                'name': mixing_agent.name,
                'image': mixing_agent.image,
                'helper': mixing_agent.helper 
            },
            'option1': {
                'id': option1.id,
                'name': option1.name,
                'image': option1.image,
                'helper': option1.helper,
                'str': '{ '+" , ".join([r.mandatory_ingredient.name for r in recipes]+[option1.name])+' }'
            },
            'option2': {
                'id': option2.id,
                'name': option2.name,
                'image': option2.image,
                'helper': option2.helper,
                'str': '{ '+" , ".join([r.mandatory_ingredient.name for r in recipes]+[option2.name])+' }'
            },
            'recipes': [{
                'id': r.id,
                'i_id': r.mandatory_ingredient.id,
                'i_name': r.mandatory_ingredient.name,
                'i_image': r.mandatory_ingredient.image,
                'i_helper': r.mandatory_ingredient.helper 
            } for r in recipes]
        }
        return render(request, "results.html", data)
