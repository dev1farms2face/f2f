from __future__ import unicode_literals

from django.db import models
from django.contrib.auth.models import User
from django.core.validators import RegexValidator

# Create your models here.

class Profile(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE)
    picture = models.FileField(upload_to='images/profile/')
    birth_date = models.DateField(blank=True, null=True)
    gender = models.CharField(max_length=30, null=True, blank=True)
    subscription = models.CharField(max_length=3, blank=True)
    location = models.CharField(max_length=30, blank=True)
    questionnaire = models.ForeignKey('facepackwizard.QuestionnaireUserData', null=True, blank=True)
    def __str__(self):
        return str(self.user)

class ShippingAddress(models.Model):
    profile = models.ForeignKey(Profile)
    first_name = models.CharField(max_length=100)
    last_name = models.CharField(max_length=100, blank=True)
    street1 = models.CharField(max_length=100, blank=True)
    street2 = models.CharField(max_length=100, blank=True)
    city = models.CharField(max_length=100, blank=True)
    state = models.CharField(max_length=50, blank=True)
    country = models.CharField(max_length=50, blank=True)
    zipcode = models.CharField(max_length=50, blank=True)
    phone_regex = RegexValidator(regex=r'^\+?1?\d{9,15}$', message="Phone number must be entered in the format: '+999999999'. Up to 15 digits allowed.")
    phone_number = models.CharField(max_length=20, validators=[phone_regex], blank=True) # validators should be a list
    primary = models.BooleanField(default=False)
    def __str__(self):
        return str(self.profile)+" "+str(self.primary)+" "+self.first_name+" "+str(street1)
