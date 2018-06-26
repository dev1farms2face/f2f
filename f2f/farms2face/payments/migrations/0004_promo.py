# -*- coding: utf-8 -*-
# Generated by Django 1.11 on 2017-08-22 00:29
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('payments', '0003_purchasehistory_subtype'),
    ]

    operations = [
        migrations.CreateModel(
            name='Promo',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=1000)),
                ('discount', models.DecimalField(decimal_places=2, default=0.0, max_digits=6)),
                ('active', models.BooleanField(default=False)),
            ],
        ),
    ]