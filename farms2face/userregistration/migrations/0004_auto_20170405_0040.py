# -*- coding: utf-8 -*-
# Generated by Django 1.10.6 on 2017-04-05 07:40
from __future__ import unicode_literals

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('userregistration', '0003_profile_subscription'),
    ]

    operations = [
        migrations.AlterField(
            model_name='profile',
            name='questionnaire',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to='facepackwizard.QuestionnaireUserData'),
        ),
    ]
