# -*- coding: utf-8 -*-
# Generated by Django 1.11 on 2017-07-20 15:28
from __future__ import unicode_literals

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('facepackwizard', '0004_auto_20170324_1818'),
        ('home', '0007_remove_customfacepack_questionnaire'),
    ]

    operations = [
        migrations.AddField(
            model_name='customfacepack',
            name='questionnaire',
            field=models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, to='facepackwizard.QuestionnaireUserData'),
        ),
    ]
