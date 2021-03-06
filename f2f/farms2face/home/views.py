from django.http import HttpResponse
from requests import request, HTTPError
from django.core.files.base import ContentFile
from django.shortcuts import render, redirect
from django.contrib.auth.models import User
from django.contrib.auth import authenticate, login, logout
from home.models import Recipe, MixingAgent, Base, Ingredient, FacePack, CustomFacePack, PrePack, FAQ, Disclaimer, Contact, Privacy
from facepackwizard.models import QuestionnaireUserData
from cart.models import Cart
from userregistration.views import init_user_login
from userregistration.models import *
from django.template.context import RequestContext
from django.shortcuts import render_to_response
from email.mime.text import MIMEText
import smtplib
from django.conf import settings
from django.core.mail import send_mail
import pdb
import json
import random
import uuid

# Create your views here.
def disclaimer(request):
    data = {
        'cart_size' : cart_size(request),
        'valid_user': get_valid_user_data(request),
        'disclaimer'       : Disclaimer.objects.all(),
    }
    return render(request, "disclaimer.html", data)

def contactus(request):
    data = {
        'cart_size' : cart_size(request),
        'valid_user': get_valid_user_data(request),
        'contact'       : Contact.objects.all(),
    }
    return render(request, "contactus.html", data)

def privacy(request):
    d = {}
    for p in Privacy.objects.all():
        d.setdefault(p.name, []).append(p.details)
    data = {
        'cart_size' : cart_size(request),
        'valid_user': get_valid_user_data(request),
        'privacy'       : [{'name': p['name'], 'details': d[p['name']]} for p in Privacy.objects.values('name').distinct()],
    }
    return render(request, "privacy.html", data)

def faq(request):
    data = {
        'cart_size' : cart_size(request),
        'valid_user': get_valid_user_data(request),
        'faq'       : FAQ.objects.all(),
    }
    return render(request, "faq.html", data)


def post_change_password(request):
    json_response = { 'success': False }
    if request.method == 'POST':
        data = json.loads(request.POST['data'])
        pwd  = data.get('password', None)
        key  = data.get('key', None)
        key  = uuid.UUID(key).hex
        if key and pwd and ForgotPass.objects.filter(id=key).count() > 0:
            fp = ForgotPass.objects.get(pk=key)
            fp.user.set_password(pwd)
            fp.user.save()
            fp.delete()
            json_response['success'] = True 
    return HttpResponse(json.dumps(json_response, ensure_ascii=False))
     

def forgot_pass(request):
    json_response = { 'success': False }
    if request.method == 'POST':
        data = json.loads(request.POST['data'])
        email = data.get('email', None)
        if User.objects.filter(email=email).count() == 1:
            fp = ForgotPass()
            if ForgotPass.objects.filter(user__email=email).count() > 0:
                fp = ForgotPass.objects.get(user__email=email);
            else:
                fp.user = User.objects.get(email=email)
                fp.save()
            url = request.get_raw_uri().replace('post_','')+str(fp.id)
            msg = MIMEText(u'A request to reset your farms2face account password has been received. <br>Click <a href="%s">here</a> to reset your password. <br> Alternatively copy paste this link in your browser: %s <br> Please ignore or report if you did not request this. <br><br>Sincerely,<br>Farms2Face Team' % (url, url), 'html')
            msg['Subject'] = 'Reset your farms2face account password'
            msg['From'] = 'no-reply@farms2face.com'
            msg['To'] = email
            s = smtplib.SMTP('localhost')
            s.sendmail('no-reply@farms2face.com', [email], msg.as_string())

            json_response['success'] = True 
    return HttpResponse(json.dumps(json_response, ensure_ascii=False))

def change_pass(request, key):
    print(key)
    return render(request, "forgot.html", {'key': key});

def get_valid_user_data(request):
    if request and request.user:
        user = request.user
        if not user.is_anonymous():
            data = {}
            data['name'] = user.first_name
            data['picture'] = 'images/profile/default.png'
            if hasattr(user, 'profile') and user.profile.picture:
                data['picture'] = user.profile.picture
            return data

def cart_size(request):
    #init_user_login(request)
    return request.user.cart_set.count() if hasattr(request.user, 'cart_set') else 0

def home(request):
    data = {
        'cart_size' : cart_size(request),
        'valid_user': get_valid_user_data(request),
        'prepacks': [p.facepack for p in PrePack.objects.all()],
        'skin_type': request.GET.get('skin_type', None)
    }
    return render(request, "home.html", data)

def login_page(request, new=False):
    data = {
        'cart_size' : cart_size(request),
        'valid_user': get_valid_user_data(request)
    }
    if not request.user.username.startswith("anon_") and request.user and get_valid_user_data(request):
        return redirect('/myaccount/account-details/', data)
    data['user'] = request.user
    data['next'] = request.GET.get('next')
    if new:
        data['new_user'] = True
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
        if user and social.user != user:
            #print "!!! social user logging out and relogging in !!!"
            #migrate_user(user, social.user)
            #user = social.user
            req = backend.strategy.request
            next = req.session['next'] if 'next' in req.session else None
            logout(backend.strategy.request)
            #magic, yes magic
            social.user.backend = "social.backends.facebook.FacebookOAuth2"
            login(backend.strategy.request, social.user)
            if next:
                backend.strategy.request.session['next'] = next
            #msg = 'This {0} account is already in use.'.format(provider)
            #raise AuthAlreadyAssociated(backend, msg)
        elif not user:
            user = social.user
    return {'social': social,
            'user': user,
            'is_new': user is None,
            'new_association': False}

def rename_social_anon_user(backend, uid, user=None, *args, **kwargs):
    if user and user.username.startswith('anon_') and user.email:
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


def save_profile_picture(strategy, backend, user, response, details,
                         is_new=False,*args,**kwargs):
    if is_new and backend.name == 'facebook':
        url = 'http://graph.facebook.com/{0}/picture?type=large'.format(response['id'])

        try:
            response = request('GET', url, params={'type': 'large'})
            response.raise_for_status()
        except HTTPError:
            pass
        else:
            if not hasattr(user, 'profile'):
                up = Profile()
                up.user = user
                up.save()
            profile = user.profile
            profile.picture.save('{0}_social.jpg'.format(user.email),
                                   ContentFile(response.content))
            profile.save()

def redirect_next(strategy, backend, user, response, details,
                         is_new=False,*args,**kwargs):
    req = backend.strategy.request
    data = {
        'cart_size' : cart_size(req),
        'valid_user': get_valid_user_data(req)
    }
    next = req.session['next'] if 'next' in req.session else None
    return;
    if next:
        if next == 'None':
            next = "/home/"
        return redirect(next, data)

def login_user(request):
    json_response = {}
    next = request.session['next'] if 'next' in request.session else None
    next = next or '/myaccount/account-details/'
    if request.is_ajax():
        data = json.loads(request.POST['data'])
        social = data['social'] if 'social' in data else None
        new = data['new'] if 'new' in data else None
        # If new user then create user first and assign to request user
        if new:
            if User.objects.filter(email=data['email']).count() == 0:
                u = User()
                u.email = data['email']
                u.username = data['email']
                u.set_password(data['password'])
                u.save()
                if not hasattr(u, 'profile'):
                    up = Profile()
                    up.user = u
                    up.save()
                # New users need to be redirected to create profile
                next = '/myaccount/account-details/'
            else: 
                # SignUp new user already exists
                json_response['error'] = "exists"
                return HttpResponse(json.dumps(json_response, ensure_ascii=False))
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
    data = { 'valid_user': get_valid_user_data(request),
             'cart_size' : cart_size(request) }
    return redirect('/signin/', data)

def post_add_cart(request):
    json_response = { 'success': False }
    if request.method == 'POST':
        init_user_login(request)
        user = request.user
        data = json.loads(request.POST['data'])
        fp_id = data.get('fp_id', None)
        fp_type = data.get('fp_type', None)
        cart_type = data.get('type', None)
        qd_id = data.get('qd_id', None)
        fp = None
        if fp_id and user.cart_set.filter(item_id=fp_id).count() > 0:
            # Cart / FP already exists. Just save new cart type state
            c = user.cart_set.get(item_id=fp_id)
            c.type = cart_type
            c.quantity = 1
            if c.type == 'subscribe':
                c.subtype='regular'
            c.save()
        else:
            if fp_type == "prepack":
                # Prepack
                fp = PrePack.objects.get(facepack_id=fp_id).facepack
            else:
                # Custom Facepack
                fp = FacePack()

                recipe1_id = int(data['r1_id'])
                recipe2_id = int(data['r2_id'])
                recipe3_id = int(data['r3_id'])
                base_id = int(data['b_id']) 
                mixing_agent_id = int(data['m_id'])
                o1_id = int(data['o1_id']) if 'o1_id' in data and len(data['o1_id']) > 0 else None
                o2_id = int(data['o2_id']) if 'o2_id' in data and len(data['o2_id']) > 0 else None
                o3_id = int(data['o3_id']) if 'o3_id' in data and len(data['o3_id']) > 0 else None

                # Create FP name
                fp_name = "CFP_%03d%03d%03d" % (recipe1_id, recipe2_id, recipe3_id)
                if o1_id and o2_id and o3_id:
                    fp_name += "111"
                else:
                    fp_name += "000"
        

                fp.base = Base.objects.get(pk=base_id)
                fp.mixing_agent = MixingAgent.objects.get(pk=mixing_agent_id)
                #fp.price = str(random.randrange(13,30)+0.99)
                fp_name += "%03d" % fp.base.id
                fp_name += "%03d" % fp.mixing_agent.id
                fp.name = fp_name

                fp.save()

                qd = QuestionnaireUserData.objects.get(pk=qd_id) 
        
                cfp1 = CustomFacePack()
                cfp1.recipe = Recipe.objects.get(pk=recipe1_id)
                cfp1.optional_ingredient = Ingredient.objects.get(pk=o1_id) if o1_id else None
                cfp1.facepack = fp
                cfp1.user = user
                cfp1.questionnaire = qd
                cfp1.save()
        
                cfp2 = CustomFacePack()
                cfp2.recipe = Recipe.objects.get(pk=recipe2_id)
                cfp2.optional_ingredient = Ingredient.objects.get(pk=o2_id) if o2_id else None
                cfp2.facepack = fp
                cfp2.user = user
                cfp2.questionnaire = qd
                cfp2.save()
        
                cfp3 = CustomFacePack()
                cfp3.recipe = Recipe.objects.get(pk=recipe3_id)
                cfp3.optional_ingredient = Ingredient.objects.get(pk=o3_id) if o3_id else None
                cfp3.facepack = fp
                cfp3.user = user
                cfp3.questionnaire = qd
                cfp3.save()
        
            c = Cart()
            c.item = fp
            c.user = user
            c.type = cart_type
            if c.type == 'buy':
                fp.price = fp.price_single
                fp.save()
            elif c.type == 'subscribe':
                c.subtype = 'regular'
                fp.price = fp.price_regular
                fp.save()
            c.save()
        json_response['success'] = True 
    return HttpResponse(json.dumps(json_response, ensure_ascii=False))

def post_remove_cart(request):
    json_response = { 'success': False }
    if request.method == 'POST':
        init_user_login(request)
        user = request.user
        data = json.loads(request.POST['data'])
        facepack_id = int(data['facepack_id'])
        facepack = FacePack.objects.get(id=facepack_id)
        # If Prepack, then no point comparing users instead just remove item from cart.
        if PrePack.objects.filter(facepack=facepack).count() > 0:
            user.cart_set.filter(item__id=facepack_id).delete()
            json_response['success'] = True
        # Check if indeed cart item remove operation is done by intended user
        elif facepack.cart_set.all()[0].user == user:
            facepack.delete()
            json_response['success'] = True
        json_response['cart_size'] = user.cart_set.count()
    return HttpResponse(json.dumps(json_response, ensure_ascii=False))
