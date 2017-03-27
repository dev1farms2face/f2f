from __future__ import unicode_literals

from django.db import models
from django.utils import timezone
from django.contrib.auth.models import User

# Create your models here.

class Shipping(models.Model):
    type = models.CharField(max_length=1000)
    cost = models.DecimalField(max_digits=6, decimal_places=2, default=0.00)
    helper = models.CharField(max_length=1000, blank=True, null=True)
    def __str__(self):
        return str(self.id)+" "+str(self.type)

class Payment(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    type = models.CharField(max_length=1000)
    shipping = models.ForeignKey(Shipping, on_delete=models.CASCADE)
    createdte = models.DateTimeField(default=timezone.now)
    def __str__(self):
        return str(self.id)+" "+str(self.user)

class PurchaseHistory(models.Model):
    payment = models.ForeignKey(Payment, on_delete=models.CASCADE)
    item = models.ForeignKey('home.Item', on_delete=models.CASCADE)
    quantity = models.IntegerField(default=1)
    def __str__(self):
        return str(self.payment)+" "+str(self.item)

