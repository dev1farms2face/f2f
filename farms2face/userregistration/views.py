from django.contrib.auth.models import User, Group
from django.http import HttpResponse
from django.contrib.auth import authenticate, login, logout
from social_django.models import UserSocialAuth
import json
import pdb

def init_user_login(request):
    # If social login then return
    if not request.user.is_anonymous() and UserSocialAuth.objects.filter(user=request.user).count > 0:
        return
    # If not valid user, create anonymous user based on session key
    if request.user.is_anonymous():
        session = request.session
        if not session.session_key:
            request.session.create()
        u = User(username="anon_"+request.session.session_key)
        u.save()
        u.backend = 'django.contrib.auth.backends.ModelBackend'
        login(request, u)

def register(request):
    json_response = { 'success': False }
    if request.method == 'POST':
        data = json.loads(request.POST['data'])
        u = User()
        u.first_name = data['first_name']
        u.last_name = data['last_name']
        u.email = data['email']
        u.username = data['email']
        u.set_password(data['password'])
        u.save()
        json_response['success'] = True;
    return HttpResponse(json.dumps(json_response, ensure_ascii=False))
