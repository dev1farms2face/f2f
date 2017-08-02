from django.contrib import admin

from .models import *

admin.site.register(Ingredient)
admin.site.register(Base)
admin.site.register(MixingAgent)
admin.site.register(Recipe)
admin.site.register(FacePack)
admin.site.register(CustomFacePack)
admin.site.register(PrePack)
admin.site.register(PrePackIngredients)
admin.site.register(Item)
admin.site.register(SkinTypeIngredient)
admin.site.register(SkinTypeConcernIngredient)
admin.site.register(FAQ)
