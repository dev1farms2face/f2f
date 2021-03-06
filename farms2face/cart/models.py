from __future__ import unicode_literals

from django.db import models
from django.contrib.auth.models import User
from django.utils import timezone

# Create your models here.

class Cart(models.Model):
    user = models.ForeignKey(User)
    item = models.ForeignKey('home.Item', on_delete=models.CASCADE)
    type = models.CharField(max_length=10, default="buy")
    subtype = models.CharField(max_length=10, null=True, default=None)
    quantity = models.IntegerField(default=1)
    createdte = models.DateTimeField(default=timezone.now)
    def __str__(self):
        return str(self.item)+" "+self.user.username

