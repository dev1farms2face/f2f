from django.contrib import admin

from .models import SkinType, SkinConcern, Option, Question, Questionnaire, QuestionnaireEntry, QuestionnaireUserData

admin.site.register(SkinType)
admin.site.register(SkinConcern)
admin.site.register(Option)
admin.site.register(Question)
admin.site.register(Questionnaire)
admin.site.register(QuestionnaireEntry)
admin.site.register(QuestionnaireUserData)
