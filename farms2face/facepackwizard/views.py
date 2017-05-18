from django.shortcuts import render, get_list_or_404

from django.http import HttpResponse
from .models import SkinType, SkinConcern, Option, Question, Questionnaire, QuestionnaireUserData, QuestionnaireEntry
from home.models import Ingredient, Base, MixingAgent, Recipe, FacePack, CustomFacePack, SkinTypeIngredient, SkinTypeConcernIngredient
from django.contrib.auth.models import User
from cart.models import Cart
from userregistration.views import init_user_login
from home.views import cart_size, get_valid_user_data
from django.db.models import Q
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
    return render(request, "wizard.html", 
                               { 'questions': data, 
                                 'cart_size': cart_size(request),
                                 'valid_user': get_valid_user_data(request) })

def wizard_submit(request):
    json_response = { 'success': False }
    if request.method == 'POST':
        init_user_login(request)
        data = json.loads(request.POST['data'])
        user = request.user
        skinType = None
        skinConcerns = None
        wz = QuestionnaireUserData()    
        wz.user = user
        wz.save()
        for d in data:
            for o in d['options']:
                qe = QuestionnaireEntry()
                qe.question = Question.objects.get(pk=d['id'])
                qe.option = Option.objects.get(pk=o)
                qe.wizard = wz
                qe.save()
            if d['id'] == '7':
                skinType = SkinType.objects.get(pk=d['options'][0]);
            if d['id'] == '8':
                skinConcerns = SkinConcern.objects.filter(id__in=d['options'])
        recipes = Recipe.objects.filter(skin_type=skinType, skin_concern__in=skinConcerns)
        recipes_ing = [r.mandatory_ingredient for r in recipes]
        skin_type_ingredients = Ingredient.objects.filter(id__in=SkinTypeIngredient.objects.filter(skin_type=skinType).values('ingredient'))
        o_ids = []
        for r in recipes:
            ri = random.choice(SkinTypeConcernIngredient.objects\
                 .filter(skin_type=r.skin_type, skin_concern=r.skin_concern)\
                 .filter(~Q(ingredient=r.mandatory_ingredient), ~Q(ingredient_id__in=o_ids))).ingredient
            o_ids.append(ri)
        base = random.choice(Base.objects.filter(skin_type=skinType))
        """
        Base conditions:
        1. French green clay cannot be used for people with skin concern "Sensitive
           and irritated by harsh ingredients"
        2. For skin combination oily and skin concern " sensitive and irritated by
           harsh ingredients" :  always use white kaolin clay
        3. For skin combination dry and skin concern " sensitive and irritated by 
           harsh ingredients" :  always use white goat milk powder
        """
        if SkinConcern.objects.get(name__contains="Sensitive") in skinConcerns:
            if skinType.name == 'Oily':
                base = Base.objects.get(name__contains='White Kaolin Clay')
            elif skinType.name == 'Dry':
                base = Base.objects.get(name__contains='Goat Milk')
            else:
                base = random.choice(Base.objects.filter(skin_type=skinType)\
                             .filter(~Q(pk=Base.objects.get(name__contains='French').id)))
        mixing_agent = random.choice(MixingAgent.objects.filter(skin_type=skinType))
        json_response = {
            'base'	   : str(base.id),
            'mixing_agent' : str(mixing_agent.id),
            'recipes'      : [str(r.id) for r in recipes],
            'optional'     : [str(o.id) for o in o_ids],
        } 
    return HttpResponse(json.dumps(json_response, ensure_ascii=False))

def results(request):
    if request and request.method == 'GET':
        init_user_login(request)
        user = request.user
        recipe_ids = [int(x) for x in request.GET.getlist('recipes[]')]
        o_ids = [int(x) for x in request.GET.getlist('optional[]')]
        recipes = Recipe.objects.filter(id__in=recipe_ids)
        secondary_ings = Ingredient.objects.filter(id__in=o_ids)
        base = Base.objects.get(pk=request.GET.get('base'))
        mixing_agent = MixingAgent.objects.get(pk=request.GET.get('mixing_agent'))
        #secondary_ings = [random.choice(SkinTypeConcernIngredient.objects\
                          #.filter(skin_type=r.skin_type, skin_concern=r.skin_concern)\
                          #.filter(~Q(ingredient=r.mandatory_ingredient))).ingredient\
                           #for r in recipes]
        essential_oils = Ingredient.objects.get(name__contains="Essential Oils")
        r1 = recipes[0]
        r2 = recipes[1]
        r3 = recipes[2]
        o1 = secondary_ings[0]
        o2 = secondary_ings[1]
        o3 = secondary_ings[2]
        o_ids = [i.id for i in secondary_ings]

        data =  {
            'first': {
                'type': 'primary',
                'base': {
                    'id': base.id,
                    'name': base.name,
                    'image': base.image,
                    'helper': base.helper,
                    'description': base.description, 
                },
                'mixing_agent': {
                    'id': mixing_agent.id,
                    'name': mixing_agent.name,
                    'image': mixing_agent.image,
                    'helper': mixing_agent.helper,
                    'description': mixing_agent.description, 
                },
                'essential_oils': {
                    'id': essential_oils.id,
                    'name': essential_oils.name,
                    'image': essential_oils.image,
                    'helper': essential_oils.helper,
                    'description': essential_oils.description,
                },
                'recipes': [{
                    'id': r.id,
                    'i_id': r.mandatory_ingredient.id,
                    'i_name': r.mandatory_ingredient.name,
                    'i_image': r.mandatory_ingredient.image,
                    'i_helper': r.mandatory_ingredient.helper,
                    'i_description': r.mandatory_ingredient.description,
                } for r in recipes],
                'b_id': base.id,
                'm_id': mixing_agent.id,
                'r1_id': r1.id,
                'r2_id': r2.id,
                'r3_id': r3.id,
                'o_ids': [],
            },
            'second': {
                'type': 'secondary',
                'base': {
                    'id': base.id,
                    'name': base.name,
                    'image': base.image,
                    'helper': base.helper,
                    'description': base.description, 
                },
                'mixing_agent': {
                    'id': mixing_agent.id,
                    'name': mixing_agent.name,
                    'image': mixing_agent.image,
                    'helper': mixing_agent.helper,
                    'description': mixing_agent.description, 
                },
                'essential_oils': {
                    'id': essential_oils.id,
                    'name': essential_oils.name,
                    'image': essential_oils.image,
                    'helper': essential_oils.helper,
                    'description': essential_oils.description,
                },
                #'recipes': [{
                    #'id': r.id,
                    #'i_id': r.mandatory_ingredient.id,
                    #'i_name': r.mandatory_ingredient.name,
                    #'i_image': r.mandatory_ingredient.image,
                    #'i_helper': r.mandatory_ingredient.helper,
                    #'i_description': r.mandatory_ingredient.description,
                #} for r in recipes],
                'recipes': [{
                    'id': i.id,
                    'i_id': i.id,
                    'i_name': i.name,
                    'i_image': i.image,
                    'i_helper': i.helper,
                    'i_description': i.description,
                } for i in secondary_ings],
                'b_id': base.id,
                'm_id': mixing_agent.id,
                'r1_id': r1.id,
                'r2_id': r2.id,
                'r3_id': r3.id,
                'o1_id': o1.id,
                'o2_id': o2.id,
                'o3_id': o3.id,
                'o_ids': o_ids,
            },
        }
        data['cart_size'] = cart_size(request)
        data['valid_user'] = get_valid_user_data(request)
        return render(request, "results.html", data)
