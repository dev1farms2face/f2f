from django.shortcuts import render
from home.views import get_valid_user_data

# Create your views here.

def payments(request):
    return render(request, "payments.html",
                  { 'valid_user' : get_valid_user_data(request) })
