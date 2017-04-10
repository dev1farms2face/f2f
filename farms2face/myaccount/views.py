from django.shortcuts import render, redirect
from django.http import HttpResponse
from home.models import Recipe, MixingAgent, Base, Ingredient, FacePack, CustomFacePack
from facepackwizard.models import *
from cart.models import Cart
from userregistration.views import init_user_login
from home.views import cart_size, get_valid_user_data
from payments.models import *
from decimal import *
from userregistration.models import *
from farms2face.utils import validate_date, validate_cc_date
import pdb
import json
import random
import datetime
import pprint
import re

# Create your views here.

def photo_upload(request):
    json_response = { 'success': False }
    if request.method == 'POST':
        pic = request.FILES['pic']
        if pic and pic.content_type.startswith('image/'):
            init_user_login(request)
            user = request.user
            if not hasattr(user, 'profile'):
                up = Profile()
                up.user = user
                up.save()
            up = user.profile
            up.picture = pic
            up.save()
            json_response['success'] = True   
    return HttpResponse(json.dumps(json_response, ensure_ascii=False))

def delete_paymenttype(request):
    json_response = { 'success': False }
    if request.method == 'POST':
        init_user_login(request)
        user = request.user
        data = json.loads(request.POST['data'])
        cc_id = data.get('id', None)
        if user.paymenttype_set.filter(pk=cc_id).count() == 1:
            cc = user.paymenttype_set.get(pk=cc_id)
            cc.delete()
            json_response['success'] = True   
    return HttpResponse(json.dumps(json_response, ensure_ascii=False))

def save_paymenttype(request):
    json_response = { 'success': False }
    if request.method == 'POST':
        init_user_login(request)
        user = request.user
        data = json.loads(request.POST['data'])
        cc_id = data.get('id', None)
        if data.get('primary', None):
            for c in user.paymenttype_set.filter(primary=True):
                c.primary=False
                c.save()
        if cc_id:
            cc = CreditCard() 
            cc.primary = True
            if int(cc_id) > 0 and user.paymenttype_set.filter(pk=cc_id).count() == 1:
                pt = user.paymenttype_set.get(pk=cc_id)
                cc = CreditCard.objects.get(pk=cc_id)
            cc.user = user
            cc.street1 = data.get('street1', "")
            cc.street2 = data.get('street2', "")
            cc.street = str(cc.street1+" "+cc.street2).strip() or cc.street
            cc.city = data.get('city', cc.city)
            cc.state = data.get('state', cc.state)
            cc.zipcode = data.get('zip', cc.zipcode)
            cc.primary = data.get('primary', cc.primary)
            cc.type = data.get('type', 'visa')
            cc.first = data.get('first_name', "")
            cc.last = data.get('last_name', "")
            cc.owner_name = str(cc.first+" "+cc.last).strip() or cc.owner_name
            cc.number = data.get('number', cc.number)
            cc.cvv = data.get('cvv', cc.cvv)
            cc.expiry = validate_cc_date(data.get('expiry', "")) or cc.expiry
            cc.primary = data.get('primary', cc.primary)
            cc.save()
            json_response['success'] = True   
    return HttpResponse(json.dumps(json_response, ensure_ascii=False))

def delete_shipping_address(request):
    json_response = { 'success': False }
    if request.method == 'POST':
        init_user_login(request)
        user = request.user
        data = json.loads(request.POST['data'])
        sh_id = data.get('id', None)
        if sh_id and hasattr(request.user, 'profile'):
            up = request.user.profile
            if up.shippingaddress_set.filter(pk=sh_id).count() == 1:
                sh = up.shippingaddress_set.get(pk=sh_id)
                sh.delete()
                json_response['success'] = True   
    return HttpResponse(json.dumps(json_response, ensure_ascii=False))

def update_shipping_address(request):
    json_response = { 'success': False }
    if request.method == 'POST':
        init_user_login(request)
        user = request.user
        data = json.loads(request.POST['data'])
        sh_id = data.get('id', None)
        if sh_id and hasattr(request.user, 'profile'):
            up = request.user.profile
            if up.shippingaddress_set.filter(pk=sh_id).count() == 1:
                sh = up.shippingaddress_set.get(pk=sh_id)
                sh.first_name = data.get('first_name', sh.first_name or "")
                sh.last_name = data.get('last_name', sh.last_name or "")
                sh.street1 = data.get('street1', sh.street1)
                sh.street2 = data.get('street2', sh.street2 or "")
                sh.city = data.get('city', sh.city)
                sh.state = data.get('state', sh.state)
                sh.zipcode = data.get('zip', sh.zipcode)
                sh.phone_number = data.get('phone', sh.phone_number)
                sh.phone_number = ''.join([s for s in list(sh.phone_number) if s.isdigit()])
                sh.primary = data.get('primary', sh.primary)
                if sh.primary:
                    for s in up.shippingaddress_set.filter(primary=True):
                        s.primary=False
                        s.save()
                sh.save()
                json_response['success'] = True   
    return HttpResponse(json.dumps(json_response, ensure_ascii=False))

def save_shipping_address(request):
    json_response = { 'success': False }
    if request.method == 'POST':
        init_user_login(request)
        user = request.user
        data = json.loads(request.POST['data'])
        if not hasattr(request.user, 'profile'):
            up = Profile()
            up.user = request.user
            up.save()
        up = request.user.profile
        for sh in up.shippingaddress_set.filter(primary=True):
            sh.primary=False        
            sh.save()
        sh = ShippingAddress()
        sh.profile = up
        sh.first_name = data.get('first_name', sh.first_name or "")
        sh.last_name = data.get('last_name', sh.last_name or "")
        sh.street1 = data.get('street1', sh.street1)
        sh.street2 = data.get('street2', sh.street2 or "")
        sh.city = data.get('city', sh.city)
        sh.state = data.get('state', sh.state)
        sh.zipcode = data.get('zip', sh.zipcode)
        sh.phone_number = data.get('phone', sh.phone_number)
        sh.phone_number = ''.join([s for s in list(sh.phone_number) if s.isdigit()])
        sh.primary = True
        sh.save()
        json_response['success'] = True   
    return HttpResponse(json.dumps(json_response, ensure_ascii=False))

def save_myaccount_details(request):
    json_response = { 'success': False }
    if request.method == 'POST':
        init_user_login(request)
        user = request.user
        data = json.loads(request.POST['data'])
        if not hasattr(request.user, 'profile'):
            up = Profile()
            up.user = request.user
            up.save()
        up = request.user.profile
        if 'name' in data:
            names = data['name'].split()
            if len(names) >= 2:
                first, last = " ".join(names[0:-1]), names[-1]
                user.first_name = first
                user.last_name = last
            elif len(names) == 1:
                user.first_name = data['name'].strip()
                user.last_name = ""
        if 'birthday' in data:
            birth_date = validate_date(data['birthday'])
            if birth_date:
                up.birth_date = birth_date
        if 'email' in data and re.match("([^@|\s]+@[^@]+\.[^@|\s]+)",data['email']):
            user.email = data['email']
            user.username = data['email']
        if 'gender' in data: 
            if data['gender'].lower == "male" or data['gender'].lower == "female" or\
                data['gender'].strip().lower == "":
                up.gender = data['gender'] 
        if 'subscription' in data:
            if data['subscription'].lower() == "yes" or data['subscription'].lower() == "no":
                up.subscription = data['subscription']
        user.save()
        up.save()
        json_response['success'] = True   
    return HttpResponse(json.dumps(json_response, ensure_ascii=False))

def update_ph(request):
    json_response = { 'success': False }
    if request.method == 'POST':
        init_user_login(request)
        user = request.user
        data = json.loads(request.POST['data'])
        ph_id = data.get('ph_id', None)
        ph_ship_date = data.get('ph_date', None)
        if hasattr(user, 'payment_set'):
            for i,py in enumerate(user.payment_set.all().order_by('createdte')):
                for j,ph in enumerate(py.purchasehistory_set.all()):
                    if ph.type == "subscribe" and ph.id == int(ph_id):
                        ph.quantity = data.get('ph_qty', None) or ph.quantity
                        ph.ship_date = validate_date(ph_ship_date) or ph.ship_date
                        ph.save()
                        json_response['success'] = True   
    return HttpResponse(json.dumps(json_response, ensure_ascii=False))

def view_myaccount(request, option=None):
    valid_options = [
        'account-details',
        'skin-profile',
        'order-history',
        'shipping-&-payments',
        'my-subscriptions',
    ]
    data = { 
        'valid_user': get_valid_user_data(request),
        'cart_size' : cart_size(request) ,
        'selected'  : option,
        'options'   : valid_options,
    }
    data['photo_upload_url'] = '/post_photo_upload/'
    if not get_valid_user_data(request) or request.user.username.startswith('anon_'):
        return redirect('/signin/?next=/myaccount/account-details', data) 
    if not option or option not in valid_options:
        return redirect('/myaccount/account-details', data)
    skin_profile = {
        'skin_concern_1' : "",
        'skin_concern_2' : "",
        'skin_concern_3' : "",
        'skin_type' : "",
        'skin_routine_evening' : "",
        'skin_routine_morning' : "",
        'sunscreen' : "",
        'environment' : "",
    }
    # Check if wizard data exists
    if QuestionnaireUserData.objects.filter(user=request.user).count() > 0:
        if not hasattr(request.user, 'profile'):
            up = Profile()
            up.user = request.user
            up.save()
        up = request.user.profile
        # Gender
        w = QuestionnaireUserData.objects.filter(user=request.user).order_by('-id')[0]
        up.gender = QuestionnaireEntry.objects.filter(wizard=w, question=2)[0].option.name 
        up.save()
        # Skin profile
        skin_profile['skin_concern_1'] = QuestionnaireEntry.objects.\
                                        filter(wizard=w, question=8)[0].option.name
        skin_profile['skin_concern_2'] = QuestionnaireEntry.objects.\
                                        filter(wizard=w, question=8)[1].option.name
        skin_profile['skin_concern_3'] = QuestionnaireEntry.objects.\
                                        filter(wizard=w, question=8)[2].option.name
        skin_profile['skin_type'] = QuestionnaireEntry.objects.\
                                        filter(wizard=w, question=7)[0].option.name
        skin_profile['skin_routine_evening'] = QuestionnaireEntry.objects.\
                                        filter(wizard=w, question=6)[0].option.name
        skin_profile['skin_routine_morning'] = QuestionnaireEntry.objects.\
                                        filter(wizard=w, question=5)[0].option.name
        skin_profile['sunscreen'] = QuestionnaireEntry.objects.\
                                        filter(wizard=w, question=4)[0].option.name
        skin_profile['environment'] = QuestionnaireEntry.objects.\
                                        filter(wizard=w, question=3)[0].option.name
    if option == 'account-details':
        data['first_name'] = request.user.first_name
        data['last_name'] = request.user.last_name
        data['email'] = request.user.email
        # Check for any user profile data
        if hasattr(request.user, 'profile'):
            up = request.user.profile
            data['gender'] = up.gender or ""
	    data['birthday'] = up.birth_date.strftime("%b %d, %Y") or ""
            data['subscription'] = up.subscription or "No"
    elif option == 'skin-profile':
        data.update(skin_profile) 
    elif option == 'order-history':
        user = request.user
        orders = []
        if hasattr(user, 'payment_set'):
            for i,py in enumerate(user.payment_set.all().order_by('createdte')):
                for j,ph in enumerate(py.purchasehistory_set.all()):
                    mandatory = []
                    optional = None
                    for cfp in CustomFacePack.objects.filter(facepack=ph.item):
                        mandatory.append({
                            'name'   : cfp.recipe.mandatory_ingredient.name,
                            'id'     : cfp.recipe.mandatory_ingredient.id,
                            'r_id'   : cfp.recipe.id,
                            'image'  : cfp.recipe.mandatory_ingredient.image,
                        })
                        optional = cfp.optional_ingredient
                    fp = FacePack.objects.get(pk=ph.item_id)
                    orders.append({
                        'sno': i+1,
                        'first': 'first' if j == 0 else '', 
                        'date': py.createdte,
                        'shipping_type': ph.shipping.type,    
                        'shipping_cost': '$'+str(ph.shipping.cost),    
                        'total': '$'+str(py.total),
                        'name': fp.name,
                        'price': '$'+str(ph.item.price),
                        'quantity': ph.quantity,
                        'base': fp.base.name,
                        'type': ph.type,
                        'mixing_agent': fp.mixing_agent.name,
                        'mandatory': mandatory,
                        'optional': {
                                     'name'  : optional.name,
                                     'image' : optional.image,
                                    } if optional else "" ,
                    }) 
        data['orders'] = orders
    elif option == 'shipping-&-payments':
        shipping = []
        if hasattr(request.user, 'profile'):
            up = request.user.profile
            for sh in up.shippingaddress_set.all():
                shipping.append({
                    'first_name': sh.first_name,
                    'last_name': sh.last_name,
                    'street1': sh.street1,
                    'street2': sh.street2,
                    'city': sh.city,
                    'state': sh.state,
                    'zip': sh.zipcode,
                    'phone': sh.phone_number,
                    'primary': sh.primary,
                    'id': sh.id,
                })
        data['shipping'] = shipping
        paymenttypes = []
        for pt in request.user.paymenttype_set.all():
            cc = CreditCard.objects.get(pk=pt.id)
            paymenttypes.append({
                'first_name': " ".join(cc.owner_name.split()[0:-1]) if cc.owner_name.split() else "",
                'last_name': cc.owner_name.split()[-1] if cc.owner_name.split() else "",
                'street': cc.street,
                'street1': cc.street,
                'street2': "",
                'city': cc.city,
                'state': cc.state,
                'zip': cc.zipcode,
                'primary': cc.primary,
                'type': cc.type,
                'number': cc.number[-4:],
                'expiry': cc.expiry.strftime("%m/%y"),
                'id': cc.id,
            })
        data['paymenttypes'] = paymenttypes
        data['url_save_shipping_address'] = '/post_save_shipping_address/'
        data['url_update_shipping_address'] = '/post_update_shipping_address/'
        data['url_delete_shipping_address'] = '/post_delete_shipping_address/'
        data['url_save_paymenttype'] = '/post_save_paymenttype/'
        data['url_delete_paymenttype'] = '/post_delete_paymenttype/'
    elif option == 'my-subscriptions':
        user = request.user
        subscriptions = []
        if hasattr(user, 'payment_set'):
            for i,py in enumerate(user.payment_set.all().order_by('createdte')):
                for j,ph in enumerate(py.purchasehistory_set.all()):
                    if ph.type == "subscribe":
                        mandatory = []
                        optional = None
                        for cfp in CustomFacePack.objects.filter(facepack=ph.item):
                            mandatory.append({
                                'name'   : cfp.recipe.mandatory_ingredient.name,
                                'id'     : cfp.recipe.mandatory_ingredient.id,
                                'r_id'   : cfp.recipe.id,
                                'image'  : cfp.recipe.mandatory_ingredient.image,
                            })
                            optional = cfp.optional_ingredient
                        fp = FacePack.objects.get(pk=ph.item_id)
                        subscriptions.append({
                            'sno': i+1,
                            'id': ph.id,
                            'ship_date': ph.ship_date.strftime("%b %d, %Y"),
                            'quantity': { 
                                'amount': ph.quantity,    
                                'helper': 'per month',
                            },
                            'cost': { 
                                'amount': '$'+str(ph.item.price),
                                'helper': 'per pack',
                            },
                            'total': { 
                                'amount': '$'+str(py.total),
                                'helper': 'Savings: $18/month',
                            },
                            'name': fp.name,
                            'base': fp.base.name,
                            'mixing_agent': fp.mixing_agent.name,
                            'mandatory': mandatory,
                            'optional': {
                                         'name'  : optional.name,
                                         'image' : optional.image,
                                        } if optional else "" ,
                        }) 
        data['subscriptions'] = subscriptions
        data['url_update_ph'] = '/post_update_ph/'
    #pprint.pprint(data)
    return render(request, "myaccount-"+option.replace('&','and')+".html", data)
