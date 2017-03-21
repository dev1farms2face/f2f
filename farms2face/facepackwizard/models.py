from __future__ import unicode_literals
from django.db import models
from django.contrib.auth.models import User
from django.utils import timezone

class SkinType(models.Model):
    name = models.CharField(max_length=1000)
    def __str__(self):
        return self.name

class SkinConcern(models.Model):
    name = models.CharField(max_length=1000)
    def __str__(self):
        return self.name

class Ingredient(models.Model):
    name = models.CharField(max_length=1000)
    def __str__(self):
        return self.name

class Base(models.Model):
    name = models.CharField(max_length=1000)
    skin_type = models.ForeignKey(SkinType, null=True, 
                                  on_delete=models.CASCADE)
    def __str__(self):
        return self.name+"_"+self.skin_type.name

class MixingAgent(models.Model):
    name = models.CharField(max_length=1000)
    skin_type = models.ForeignKey(SkinType, null=True, 
      				  on_delete=models.CASCADE)
    def __str__(self):
        return self.name+"_"+self.skin_type.name

class Recipe(models.Model):
    skin_type = models.ForeignKey(SkinType, on_delete=models.CASCADE)
    skin_concern = models.ForeignKey(SkinConcern, on_delete=models.CASCADE)
    mandatory_ingredient = models.ForeignKey(Ingredient, 
				             on_delete=models.CASCADE)
    def __str__(self):
        return self.skin_type.name+"__"+self.skin_concern.name+\
	       "__"+self.mandatory_ingredient.name
class FacePack(models.Model):
    user = models.ForeignKey(User, null=True, on_delete=models.CASCADE)
    in_cart = models.BooleanField(default=False)
    quantity = models.IntegerField(default=1)
    createdte = models.DateTimeField(default=timezone.now, blank=True)
    def __str__(self):
        return self.user.first_name+" "+self.in_cart
    def __unicode__(self):
        return unicode(self.in_cart) or u''

class CustomPack(models.Model):
    facepack = models.ForeignKey(FacePack, null=True, on_delete=models.CASCADE)
    recipe = models.ForeignKey(Recipe, on_delete=models.CASCADE)
    optional_ingredient = models.ForeignKey(Ingredient, 
                                            blank=True, null=True, 
                                            on_delete=models.CASCADE)
    base = models.ForeignKey(Base, on_delete=models.CASCADE)
    mixing_agent = models.ForeignKey(MixingAgent, on_delete=models.CASCADE)
    def __str__(self):
        return self.facepack
    def __unicode__(self):
        return unicode(self.facepack) or u''

class PrePack(models.Model):
    facepack = models.ForeignKey(FacePack, on_delete=models.CASCADE)
    name = models.CharField(max_length=1000)
    ingredient = models.ForeignKey(Ingredient, on_delete=models.CASCADE)
    def __str__(self):
        return self.name
    def __unicode__(self):
        return unicode(self.facepack) or u''

class Purchases(models.Model):
    user = models.ForeignKey(User, null=True, on_delete=models.CASCADE)
    transaction_id = models.BigIntegerField()
    facepack = models.ForeignKey(FacePack, on_delete=models.CASCADE)
    def __str__(self):
        return self.transaction_id
