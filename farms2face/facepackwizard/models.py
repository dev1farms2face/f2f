from __future__ import unicode_literals
from django.db import models
from django.contrib.auth.models import User
from django.utils import timezone
from django.contrib.contenttypes.fields import GenericForeignKey
from django.contrib.contenttypes.models import ContentType

class Option(models.Model):
    name = models.CharField(max_length=256)
    helper = models.CharField(max_length=1000, blank=True, null=True)
    def __str__(self):
        return self.name

class Question(models.Model):
    name = models.CharField(max_length=1000)
    why = models.CharField(max_length=1000)
    def __str__(self):
        return self.name

class Questionnaire(models.Model):
    question = models.ForeignKey(Question, blank=True, on_delete=models.CASCADE)
    option = models.ForeignKey(Option, blank=True, on_delete=models.CASCADE)
    def __str__(self):
        return self.question.name+" "+self.option.name

class SkinType(Option):
    pass

class SkinConcern(Option):
    pass

class QuestionnaireUserData(models.Model):
    user = models.ForeignKey(User, null=True, on_delete=models.SET_NULL)
    createdte = models.DateTimeField(default=timezone.now)
    def __str__(self):
        return str(self.id)+" "+str(self.user)

class QuestionnaireEntry(models.Model):
    wizard = models.ForeignKey(QuestionnaireUserData, on_delete=models.CASCADE)
    question = models.ForeignKey(Question, on_delete=models.CASCADE)
    option = models.ForeignKey(Option, on_delete=models.CASCADE)
    def __str__(self):
        return str(self.wizard.id)+" "+str(self.question)+" "+str(self.option)
