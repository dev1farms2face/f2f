from django.contrib import admin

from .models import Ingredient, Base, MixingAgent, Recipe, FacePack, CustomFacePack, PrePack, Item

admin.site.register(Ingredient)
admin.site.register(Base)
admin.site.register(MixingAgent)
admin.site.register(Recipe)
admin.site.register(FacePack)
admin.site.register(CustomFacePack)
admin.site.register(PrePack)
admin.site.register(Item)
