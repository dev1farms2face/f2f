from django.contrib import admin

#from .models import SkinType, SkinConcern, Ingredient, Base, MixingAgent, Recipe, PrePack
from .models import SkinType, SkinConcern, Ingredient, Base, MixingAgent, Recipe, Option, Question, Questionnaire, FacePack, CustomPack, PrePack

admin.site.register(SkinType)
admin.site.register(SkinConcern)
admin.site.register(Ingredient)
admin.site.register(Base)
admin.site.register(MixingAgent)
admin.site.register(Recipe)
admin.site.register(Option)
admin.site.register(Question)
admin.site.register(Questionnaire)
admin.site.register(FacePack)
admin.site.register(CustomPack)
admin.site.register(PrePack)
