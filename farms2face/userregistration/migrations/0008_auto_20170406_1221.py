# -*- coding: utf-8 -*-
# Generated by Django 1.10.6 on 2017-04-06 19:21
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('userregistration', '0007_auto_20170406_0855'),
    ]

    operations = [
        migrations.AddField(
            model_name='shippingaddress',
            name='first_name',
            field=models.CharField(default='', max_length=100),
            preserve_default=False,
        ),
        migrations.AddField(
            model_name='shippingaddress',
            name='last_name',
            field=models.CharField(blank=True, max_length=100),
        ),
    ]
