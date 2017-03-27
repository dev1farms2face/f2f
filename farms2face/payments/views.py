from django.shortcuts import render
from home.views import get_name_if_valid_user

# Create your views here.

def payments(request):
    return render(request, "payments.html",
                  { 'valid_user' : get_name_if_valid_user(request) })
