# -*- coding: utf-8 -*-
# Generated by Django 1.11 on 2017-07-20 06:40
from __future__ import unicode_literals

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('home', '0003_prepack_description'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='prepack',
            name='description',
        ),
    ]
