# Create your models here.

from __future__ import unicode_literals
from django.db import models
from django.utils import timezone
from django.contrib.auth.models import User
from django.contrib.contenttypes.fields import GenericForeignKey
from django.contrib.contenttypes.models import ContentType
        
class Review(models.Model):
    ph = models.ForeignKey('payments.PurchaseHistory', on_delete=models.CASCADE)
    fp = models.ForeignKey('home.FacePack', on_delete=models.CASCADE)
    headline = models.CharField(max_length=100, blank=True)
    details = models.CharField(max_length=1000, blank=True, null=True)
    rating = models.IntegerField(default=0)
    useful = models.IntegerField(default=0)
    not_useful = models.IntegerField(default=0)
    createdte = models.DateTimeField(default=timezone.now)
    def __str__(self):
        return self.fp.name+" "+self.ph.user.email

class ReviewImage(models.Model):
    review = models.ForeignKey(Review, null=True, on_delete=models.CASCADE)
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    image = models.FileField(upload_to='images/reviews/')
    def __str__(self):
        return str(self.user.email)+" "+str(self.image)
