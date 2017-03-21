from django.shortcuts import render

# Create your views here.

def prepacks(request):
    return render(request, "prepacks.html",
                  {'data': {}})
