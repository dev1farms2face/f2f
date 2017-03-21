from django.contrib.auth.models import User, Group
from django.http import HttpResponse
import json

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
