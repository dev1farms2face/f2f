from django.shortcuts import render, get_list_or_404

from django.http import HttpResponse
from .models import SkinType, SkinConcern, Option, Question, Questionnaire, QuestionnaireUserData, QuestionnaireEntry
from home.models import Ingredient, Base, MixingAgent, Recipe, FacePack, CustomFacePack, SkinTypeIngredient
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
        optional_ingr1 = random.choice([x for x in skin_type_ingredients if x not in recipes_ing])
        optional_ingr2 = random.choice([x for x in skin_type_ingredients \
                                        if x not in recipes_ing and x != optional_ingr1])
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
            'option_1'     : str(optional_ingr1.id),
            'option_2'     : str(optional_ingr2.id),
        } 
    return HttpResponse(json.dumps(json_response, ensure_ascii=False))

def results(request):
    if request and request.method == 'GET':
        init_user_login(request)
        user = request.user
        recipe_ids = map(int, request.GET.getlist('recipes[]'))
        recipes = Recipe.objects.filter(id__in=map(int, recipe_ids))
        base = Base.objects.get(pk=request.GET.get('base'))
        mixing_agent = MixingAgent.objects.get(pk=request.GET.get('mixing_agent'))
        option1 = Ingredient.objects.get(pk=request.GET.get('option_1'))
        option2 = Ingredient.objects.get(pk=request.GET.get('option_2'))
        essential_oils = Ingredient.objects.get(name__contains="Essential Oils")
        r1 = recipes[0]
        r2 = recipes[1]
        r3 = recipes[2]

        data =  {
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
            'option1': {
                'id': option1.id,
                'name': option1.name,
                'image': option1.image,
                'helper': option1.helper,
                'description': option1.description,
                'str': '{ '+" , ".join([r.mandatory_ingredient.name for r in recipes]+[option1.name])+' }'
            },
            'option2': {
                'id': option2.id,
                'name': option2.name,
                'image': option2.image,
                'helper': option2.helper,
                'description': option2.description,
                'str': '{ '+" , ".join([r.mandatory_ingredient.name for r in recipes]+[option2.name])+' }'
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
            'o1_id': option1.id,
            'o2_id': option2.id,
            'r1_id': r1.id,
            'r2_id': r2.id,
            'r3_id': r3.id,
        }

        # CART CHECK
        # 
        # Check whether a current cart item(s) exists that matches an existing facepack entry in DB 
        # that matches the ingredient combination, and for the same user.
        # If so then flag this rendered page has items already in cart.
        # Do this for facepack1, facepack2 and facepack3
        # 
        # FP check (there could be more than 1 fp selected per page eg: fp1 and fp2)
        if cart_size(request) > 0:
            for fp in FacePack.objects.filter(base=base, mixing_agent=mixing_agent):
                if sorted([r['recipe_id'] for r in CustomFacePack.objects.filter(facepack=fp).values('recipe_id')]) == sorted(recipe_ids) and user.cart_set.filter(item=fp).count() > 0:
                    # FP1 check
                    optional_ingr_set = set([c.optional_ingredient_id for c in CustomFacePack.objects.filter(facepack=fp)])
                    cart_type = user.cart_set.get(item=fp).type
                    if None in optional_ingr_set:
                        data['fp1'] = fp.id
                        data['fp1_type'] = cart_type
                    elif option1.id in optional_ingr_set:
                        data['fp2'] = fp.id
                        data['fp2_type'] = cart_type
                    elif option2.id in optional_ingr_set:
                        data['fp3'] = fp.id
                        data['fp3_type'] = cart_type
	data['cart_size'] = cart_size(request)
        data['valid_user'] = get_valid_user_data(request)
        return render(request, "results.html", data)
