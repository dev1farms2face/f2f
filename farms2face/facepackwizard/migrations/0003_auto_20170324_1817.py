# -*- coding: utf-8 -*-
# Generated by Django 1.10.5 on 2017-03-25 01:17
from __future__ import unicode_literals

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('facepackwizard', '0002_auto_20170324_1812'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='questionnaireentry',
            name='option',
        ),
        migrations.RemoveField(
            model_name='questionnaireentry',
            name='question',
        ),
        migrations.RemoveField(
            model_name='questionnaireentry',
            name='wizard',
        ),
        migrations.RemoveField(
            model_name='questionnaireuserdata',
            name='user',
        ),
        migrations.DeleteModel(
            name='QuestionnaireEntry',
        ),
        migrations.DeleteModel(
            name='QuestionnaireUserData',
        ),
    ]
