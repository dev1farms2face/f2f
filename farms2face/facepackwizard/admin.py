from django.contrib import admin

#from .models import SkinType, SkinConcern, Ingredient, Base, MixingAgent, Recipe, PrePack
from .models import SkinType, SkinConcern, Ingredient, Base, MixingAgent, Recipe

admin.site.register(SkinType)
admin.site.register(SkinConcern)
admin.site.register(Ingredient)
admin.site.register(Base)
admin.site.register(MixingAgent)
admin.site.register(Recipe)
#admin.site.register(PrePack)
