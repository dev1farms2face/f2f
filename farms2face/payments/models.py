from __future__ import unicode_literals

from django.db import models
from django.utils import timezone
from django.contrib.auth.models import User
from datetime import datetime, timedelta

# Create your models here.

class Promo(models.Model):
    name = models.CharField(max_length=1000)
    discount = models.DecimalField(max_digits=6, decimal_places=2, default=0.00)
    active = models.BooleanField(default=False)
    def __str__(self):
        return str(self.name)+" "+str(self.discount)

class Shipping(models.Model):
    type = models.CharField(max_length=1000)
    cost = models.DecimalField(max_digits=6, decimal_places=2, default=0.00)
    helper = models.CharField(max_length=1000, blank=True, null=True)
    def __str__(self):
        return str(self.type)
    def get_days(self):
        if self.id == 1:
            return 1
        elif self.id == 2:
            return 2 
        elif self.id == 3:
            return 3
        elif self.id == 4:
            return 8

class PaymentType(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    street = models.CharField(max_length=100, blank=True)
    city = models.CharField(max_length=100, blank=True)
    state = models.CharField(max_length=50, blank=True)
    country = models.CharField(max_length=50, blank=True)
    zipcode = models.CharField(max_length=50, blank=True)
    primary = models.BooleanField(default=False)
    def __str__(self):
        return str(self.user)+" "+str(self.primary)

class PayPal(PaymentType):
    pass

class Stripe(PaymentType):
    customer_id = models.CharField(max_length=50)
    type = models.CharField(max_length=50)
    created =  models.CharField(max_length=20)
    owner_name = models.CharField(max_length=100, blank=True)
    number = models.CharField(max_length=16, blank=True)
    expiry = models.DateField(blank=True)
    def __str__(self):
        return self.customer_id

class CreditCard(PaymentType):
    type = models.CharField(max_length=50)
    owner_name = models.CharField(max_length=100, blank=True)
    number = models.CharField(max_length=16, blank=True)
    cvv = models.IntegerField(blank=True)
    expiry = models.DateField(blank=True)
    def __str__(self):
        if self.number and len(self.number) >= 4:
            return str(self.user)+" "+self.type+" "+self.number[-4:]
        else:
            return str(self.user)+" "+self.type+" "+self.number

class Payment(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    type = models.ForeignKey(PaymentType)
    total = models.DecimalField(max_digits=6, decimal_places=2, default=0.00)
    createdte = models.DateTimeField(default=timezone.now)
    def __str__(self):
        return str(self.id)+" "+str(self.user)

class PurchaseHistory(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    payment = models.ForeignKey(Payment, on_delete=models.CASCADE)
    item = models.ForeignKey('home.Item', on_delete=models.CASCADE)
    type = models.CharField(max_length=10, default="buy")
    subtype = models.CharField(max_length=10, null=True, blank=True, default=None)
    shipping = models.ForeignKey(Shipping, on_delete=models.CASCADE)
    quantity = models.IntegerField(default=1)
    ship_date = models.DateField(blank=True, null=True)
    is_fulfilled = models.BooleanField(default=False)
    tracking = models.CharField(max_length=1000, blank=True, null=True)
    prev_tracking = ""
    readonly_fields = ('shippingaddress_callable',)
    def __str__(self):
        fulfilled_status = "Fulfilled" if self.is_fulfilled else "Not Fulfilled"
        fp = self.item.facepack
        fp_name = "NA"
        if fp.customfacepack_set.count() > 0:
            fp_name = " , ".join([i.optional_ingredient.name \
                      if i.optional_ingredient else \
                      i.recipe.mandatory_ingredient.name+"* " \
                      for i in fp.customfacepack_set.all()]) 
            base = fp.base.name 
            ma = fp.mixing_agent.name 
            fp_name += ", %s (Base) , %s (MixingAgent)" % (base,ma) 
        elif fp.prepack_set.count() == 1:
            fp_name = fp.facepack.name
        return fulfilled_status+" | Ordered on: "+\
            self.payment.createdte.strftime("%B %d, %Y")+\
            " | By: "+str(self.user)+" | FaceMask: "+fp_name+\
            " | Tracking: "+str(self.tracking)
    def save(self, *args, **kwargs):
        if not self.ship_date:
            self.ship_date = datetime.now()+timedelta(days=(self.shipping.get_days()))
        super(PurchaseHistory, self).save(*args, **kwargs)
    def shippingaddress(self):
        res = "N/A"
        if self.user.profile.shippingaddress_set.filter(primary=True).count() > 0:
            sh = self.user.profile.shippingaddress_set.get(primary=True)
            res = [sh.street1, sh.street2, sh.city, sh.state+" - "+sh.zipcode]
            res = ",\n ".join([i for i in res if i])
        return res
    def details(self):
        fp = self.item.facepack
        fp_name = "NA"
        if fp.customfacepack_set.count() > 0:
            fp_name = ",\n".join([i.optional_ingredient.name \
                      if i.optional_ingredient else \
                      i.recipe.mandatory_ingredient.name+"* " \
                      for i in fp.customfacepack_set.all()]) 
            base = fp.base.name 
            ma = fp.mixing_agent.name 
            fp_name += ",\n %s (Base) ,\n %s (MixingAgent)" % (base,ma) 
        elif fp.prepack_set.count() == 1:
            fp_name = fp.facepack.name
        return fp_name
