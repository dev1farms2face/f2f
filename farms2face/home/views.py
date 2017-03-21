from django.http import HttpResponse
from django.shortcuts import render
from django.contrib.auth import authenticate, login, logout
from facepackwizard.models import Purchases, CustomPack, Recipe, MixingAgent, FacePack, PrePack, Base, Ingredient
import pdb
import json
import random

# Create your views here.

def main(request):
    data = {'cart_size':0}
    if request.user.id:
        user_id = request.user.id
        first_name = request.user.first_name
        cart_size = FacePack.objects.filter(user=request.user, 
                                              in_cart=True).count()
        data = {
            'first_name': first_name,
            'user_id': user_id,
            'cart_size': cart_size
        } 
    return render(request, "main.html", {'data': data})

def cart(request):
    return render(request, "cart.html",
                  {'cart': get_facepacks_user_cart(request.user)})

def home(request):
    return render(request, "home.html",
                  {'data': {}})

def login_user(request):
    json_response = {}
    if request.is_ajax():
        data = json.loads(request.POST['data'])
        email = data['email'] 
        password = data['password']
        user = authenticate(username=email, password=password)
        if user and user.is_active:
            login(request, user)
            json_response['success'] = True
            json_response['first_name'] = user.first_name
        else:
            json_response['success'] = False
    return HttpResponse(json.dumps(json_response, ensure_ascii=False))

def logout_user(request):
    if request.is_ajax():
        logout(request)
    return HttpResponse(json.dumps({}, ensure_ascii=False))

def get_facepacks_user_cart(user):
    facepack_user_cart_data = [] 
    for f in FacePack.objects.filter(user=user, in_cart=True):
        if len(f.custompack_set.all()) > 0:
            c_set = f.custompack_set.all()
            recipes = [c.recipe.mandatory_ingredient for c in c_set]
            base = c_set[0].base
            mixing_agent = c_set[0].mixing_agent
            facepack_name_list = [x.name for x in [base]+[mixing_agent]+recipes]
            facepack_name = " + ".join(facepack_name_list)
            if c.optional_ingredient:
                facepack_name_list.append(c.optional_ingredient.name) 
            facepack_user_cart_data.append({
                'id': str(f.id),
                'qty': str(f.quantity),
                'cost': str(random.randrange(13,20)+0.99),
                'name': facepack_name 
            })
        elif len(f.prepack_set.all()) > 0:
            p_set = f.prepack_set.all()
            ingredients = " + ".join([p.ingredient.name for p in p_set])
            facepack_name = p_set[0].name+" { "+ingredients+" }"
            facepack_user_cart_data.append({
                'id': str(f.id),
                'qty': str(f.quantity),
                'cost': str(random.randrange(13,20)+0.99),
                'name': facepack_name 
            })
    return facepack_user_cart_data

def post_add_cart(request):
    json_response = { 'success': False }
    if request.method == 'POST':
        user = request.user
        data = json.loads(request.POST['data'])
        recipe_ids = map(int, data['recipe_ids'].split())
        base_id = int(data['base_id']) 
        mixing_agent_id = int(data['mixing_agent_id'])
        optional_id = int(data['optional_id'])

        facepack = FacePack()
        facepack.user = user
        facepack.in_cart = True
        facepack.save()
        for recipe in Recipe.objects.filter(id__in=recipe_ids):
            custom_pack = CustomPack()
            custom_pack.facepack = facepack
            custom_pack.recipe = recipe
            if optional_id > 0:
                custom_pack.optional_ingredient = Ingredient.objects.get(id=optional_id)
            custom_pack.base = Base.objects.get(id=base_id)
            custom_pack.mixing_agent = MixingAgent.objects.get(id=mixing_agent_id)
            custom_pack.save()
        json_response['success'] = True 
        json_response['facepack_id'] = facepack.id 
        json_response['cart_size'] = FacePack.objects.filter(user=user, 
                                              in_cart=True).count()
    return HttpResponse(json.dumps(json_response, ensure_ascii=False))

def post_remove_cart(request):
    json_response = { 'success': False }
    if request.method == 'POST':
        user = request.user
        data = json.loads(request.POST['data'])
        facepack_id = int(data['facepack_id'])
        facepack = FacePack.objects.get(id=facepack_id)
        if facepack.user == user:
            facepack.delete()
        json_response['success'] = True
        json_response['cart_size'] = FacePack.objects.filter(user=user, 
                                              in_cart=True).count()
    return HttpResponse(json.dumps(json_response, ensure_ascii=False))
