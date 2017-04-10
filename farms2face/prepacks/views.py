from django.shortcuts import render
from home.views import cart_size, get_valid_user_data

# Create your views here.

def prepacks(request):
    data = { 'valid_user': get_valid_user_data(request),
             'cart_size' : cart_size(request) }
    return render(request, "prepacks.html", data)
