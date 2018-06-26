from django.shortcuts import render
from .models import Story
from home.views import cart_size, get_valid_user_data

# Create your views here.

def show_story(request):
    data = {
        'cart_size' : cart_size(request),
        'valid_user': get_valid_user_data(request),
        'title': Story.objects.get(pk=1),
        'section_1': Story.objects.get(pk=2),
        'section_2': Story.objects.get(pk=3),
        'section_3': Story.objects.get(pk=4),
        'section_4': Story.objects.get(pk=5),
        'section_5': Story.objects.get(pk=6),
        'section_6': Story.objects.get(pk=7),
    }
    return render(request, "story.html", data)

