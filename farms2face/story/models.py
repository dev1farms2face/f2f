from __future__ import unicode_literals
from django.db import models
from django.contrib.contenttypes.models import ContentType

class Story(models.Model):
    name = models.CharField(max_length=100)
    title = models.CharField(max_length=1000)
    image = models.FileField(upload_to='images/story/')
    description = models.CharField(max_length=3000, blank=True, null=True)
    description2 = models.CharField(max_length=3000, blank=True, null=True)
    def __str__(self):
        return self.name+" "+self.title
