from django.http import HttpResponse
from django.shortcuts import render, redirect
from django.contrib.auth.models import User
from django.contrib.auth import authenticate, login, logout
from home.models import Recipe, MixingAgent, Base, Ingredient, FacePack, CustomFacePack
from cart.models import Cart
from userregistration.views import init_user_login
from django.template.context import RequestContext
from django.shortcuts import render_to_response
import pdb
import json
import random

# Create your views here.

def get_name_if_valid_user(request):
    if request and request.user:
        user = request.user
        if not user.is_anonymous():
            return user.first_name

def cart_size(request):
    #init_user_login(request)
    return request.user.cart_set.count() if hasattr(request.user, 'cart_set') else 0

def home(request):
    data = {
        'cart_size' : cart_size(request),
        'valid_user': get_name_if_valid_user(request)
    }
    return render(request, "home.html", data)

def login_page(request):
    data = {
        'user': request.user,
        'valid_user': get_name_if_valid_user(request),
        'cart_size' : cart_size(request),
        'next': request.GET.get('next')
    }                      
    request.session['next'] = request.GET.get('next')
    return render(request, "login.html",  data) 

def migrate_user(old_user, new_user):
    for related_objects in \
        [getattr(old_user, x.name+'_set').all() for x in \
        old_user._meta.related_objects if hasattr(old_user, x.name+'_set')]:
        for obj in related_objects:
            obj.user = new_user
            obj.save()

def social_user(backend, uid, user=None, *args, **kwargs):
    '''OVERRIDED: It will logout the current user
    instead of raise an exception '''

    provider = backend.name
    social = backend.strategy.storage.user.get_social_auth(provider, uid)
    if social:
        #pdb.set_trace()
        if user and social.user != user:
            #print "!!! social user logging out and relogging in !!!"
            #migrate_user(user, social.user)
            #user = social.user
            logout(backend.strategy.request)
            #msg = 'This {0} account is already in use.'.format(provider)
            #raise AuthAlreadyAssociated(backend, msg)
        elif not user:
            user = social.user
    return {'social': social,
            'user': user,
            'is_new': user is None,
            'new_association': False}

def rename_social_anon_user(backend, uid, user=None, *args, **kwargs):
    if user and user.username.startswith('anon_'):
        objs = User.objects.filter(email=user.email)
        if len(objs) > 1:
            orig = User.objects.get(email=user.email, username=user.email)
            migrate_user(user, orig)
            user.delete()
            user = orig
        user.username = user.email
        user.save()
    provider = backend.name
    social = backend.strategy.storage.user.get_social_auth(provider, uid)
    return {'social': social,
            'user': user,
            'is_new': user is None,
            'new_association': False}

def login_user(request):
    json_response = {}
    next = request.session['next']
    if request.is_ajax():
        data = json.loads(request.POST['data'])
        social = data['social'] if 'social' in data else None
        current_user = request.user
        if social == 'fb': 
            social_login_url = "/login/facebook/?next=%s" % next
            json_response['success'] = True
            json_response['first_name'] = ""
            json_response['next'] = social_login_url
        else:
            email = data['email'] 
            password = data['password']
            new_user = authenticate(username=email, password=password)
            # Migrate any 'anon_xxx' user data to a valid user. Note that this
            # does NOT imply that user.is_anonymous is True. In latter case
            # there is no migration needed anyway. eg: valid user logs in initially.
            if current_user.username.startswith("anon_"):
                migrate_user(current_user, new_user)
                current_user.delete()
            if new_user and new_user.is_active:
                login(request, new_user)
                json_response['success'] = True
                json_response['first_name'] = new_user.first_name
                json_response['email'] = new_user.email
                json_response['next'] = next
            else:
                json_response['success'] = False
    return HttpResponse(json.dumps(json_response, ensure_ascii=False))

def logout_user(request):
    next = request.GET.get('next')
    logout(request)
    data = { 'valid_user': get_name_if_valid_user(request),
             'cart_size' : cart_size(request) }
    return redirect('/signin/', data)

def post_add_cart(request):
    json_response = { 'success': False }
    if request.method == 'POST':
        init_user_login(request)
        user = request.user
        data = json.loads(request.POST['data'])
        recipe1_id = int(data['r1_id'])
        recipe2_id = int(data['r2_id'])
        recipe3_id = int(data['r3_id'])
        base_id = int(data['b_id']) 
        mixing_agent_id = int(data['m_id'])
        optional_id = int(data['o_id']) if 'o_id' in data and len(data['o_id']) > 0 else None

	optional_ing = None
        if optional_id:
            optional_ing = Ingredient.objects.get(pk=optional_id)

        # Create FP name
        fp_name = "CFP_%03d%03d%03d" % (recipe1_id, recipe2_id, recipe3_id)
        if optional_id:
            fp_name += "%03d" % optional_id
        else:
            fp_name += "000"

        fp = FacePack()
        fp.base = Base.objects.get(pk=base_id)
        fp.mixing_agent = MixingAgent.objects.get(pk=mixing_agent_id)
        fp.price = str(random.randrange(13,30)+0.99)
        fp.name = fp_name
        fp.save()

	cfp1 = CustomFacePack()
        cfp1.recipe = Recipe.objects.get(pk=recipe1_id)
        cfp1.optional_ingredient = optional_ing
        cfp1.facepack = fp
        cfp1.user = user
        cfp1.save()

	cfp2 = CustomFacePack()
        cfp2.recipe = Recipe.objects.get(pk=recipe2_id)
        cfp2.optional_ingredient = optional_ing
        cfp2.facepack = fp
        cfp2.user = user
        cfp2.save()

	cfp3 = CustomFacePack()
        cfp3.recipe = Recipe.objects.get(pk=recipe3_id)
        cfp3.optional_ingredient = optional_ing
        cfp3.facepack = fp
        cfp3.user = user
        cfp3.save()

        c = Cart()
        c.item = fp
        c.user = user
        c.save()

        json_response['success'] = True 
        json_response['facepack_id'] = fp.id 
        json_response['cart_size'] = cart_size(request)
    print json_response
    return HttpResponse(json.dumps(json_response, ensure_ascii=False))

def post_remove_cart(request):
    json_response = { 'success': False }
    if request.method == 'POST':
        init_user_login(request)
        user = request.user
        data = json.loads(request.POST['data'])
        facepack_id = int(data['facepack_id'])
        facepack = FacePack.objects.get(id=facepack_id)
        # Check if indeed cart item remove operation is done by intended user
        if facepack.cart_set.all()[0].user == user:
            facepack.delete()
            json_response['success'] = True
        json_response['cart_size'] = user.cart_set.count()
    return HttpResponse(json.dumps(json_response, ensure_ascii=False))
