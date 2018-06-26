# -*- coding: utf-8 -*-
# Generated by Django 1.10.5 on 2017-03-25 01:18
from __future__ import unicode_literals

from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion
import django.utils.timezone


class Migration(migrations.Migration):

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
        ('facepackwizard', '0003_auto_20170324_1817'),
    ]

    operations = [
        migrations.CreateModel(
            name='QuestionnaireEntry',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('option', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='facepackwizard.Option')),
                ('question', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='facepackwizard.Question')),
            ],
        ),
        migrations.CreateModel(
            name='QuestionnaireUserData',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('createdte', models.DateTimeField(default=django.utils.timezone.now)),
                ('user', models.ForeignKey(null=True, on_delete=django.db.models.deletion.SET_NULL, to=settings.AUTH_USER_MODEL)),
            ],
        ),
        migrations.AddField(
            model_name='questionnaireentry',
            name='wizard',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='facepackwizard.QuestionnaireUserData'),
        ),
    ]
