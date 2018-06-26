# -*- coding: utf-8 -*-
# Generated by Django 1.11 on 2017-07-20 06:27
from __future__ import unicode_literals

from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion
import django.utils.timezone


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
        ('home', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='Payment',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('total', models.DecimalField(decimal_places=2, default=0.0, max_digits=6)),
                ('createdte', models.DateTimeField(default=django.utils.timezone.now)),
            ],
        ),
        migrations.CreateModel(
            name='PaymentType',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('street', models.CharField(blank=True, max_length=100)),
                ('city', models.CharField(blank=True, max_length=100)),
                ('state', models.CharField(blank=True, max_length=50)),
                ('country', models.CharField(blank=True, max_length=50)),
                ('zipcode', models.CharField(blank=True, max_length=50)),
                ('primary', models.BooleanField(default=False)),
            ],
        ),
        migrations.CreateModel(
            name='PurchaseHistory',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('type', models.CharField(default='buy', max_length=10)),
                ('quantity', models.IntegerField(default=1)),
                ('ship_date', models.DateField(blank=True, null=True)),
                ('is_active', models.BooleanField(default=True)),
                ('item', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='home.Item')),
                ('payment', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='payments.Payment')),
            ],
        ),
        migrations.CreateModel(
            name='Shipping',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('type', models.CharField(max_length=1000)),
                ('cost', models.DecimalField(decimal_places=2, default=0.0, max_digits=6)),
                ('helper', models.CharField(blank=True, max_length=1000, null=True)),
            ],
        ),
        migrations.CreateModel(
            name='CreditCard',
            fields=[
                ('paymenttype_ptr', models.OneToOneField(auto_created=True, on_delete=django.db.models.deletion.CASCADE, parent_link=True, primary_key=True, serialize=False, to='payments.PaymentType')),
                ('type', models.CharField(max_length=50)),
                ('owner_name', models.CharField(blank=True, max_length=100)),
                ('number', models.CharField(blank=True, max_length=16)),
                ('cvv', models.IntegerField(blank=True)),
                ('expiry', models.DateField(blank=True)),
            ],
            bases=('payments.paymenttype',),
        ),
        migrations.CreateModel(
            name='PayPal',
            fields=[
                ('paymenttype_ptr', models.OneToOneField(auto_created=True, on_delete=django.db.models.deletion.CASCADE, parent_link=True, primary_key=True, serialize=False, to='payments.PaymentType')),
            ],
            bases=('payments.paymenttype',),
        ),
        migrations.CreateModel(
            name='Stripe',
            fields=[
                ('paymenttype_ptr', models.OneToOneField(auto_created=True, on_delete=django.db.models.deletion.CASCADE, parent_link=True, primary_key=True, serialize=False, to='payments.PaymentType')),
                ('customer_id', models.CharField(max_length=50)),
                ('type', models.CharField(max_length=50)),
                ('created', models.CharField(max_length=20)),
                ('owner_name', models.CharField(blank=True, max_length=100)),
                ('number', models.CharField(blank=True, max_length=16)),
                ('expiry', models.DateField(blank=True)),
            ],
            bases=('payments.paymenttype',),
        ),
        migrations.AddField(
            model_name='purchasehistory',
            name='shipping',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='payments.Shipping'),
        ),
        migrations.AddField(
            model_name='purchasehistory',
            name='user',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL),
        ),
        migrations.AddField(
            model_name='paymenttype',
            name='user',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL),
        ),
        migrations.AddField(
            model_name='payment',
            name='type',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='payments.PaymentType'),
        ),
        migrations.AddField(
            model_name='payment',
            name='user',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL),
        ),
    ]