from django.contrib import admin

from .models import *

admin.site.register(Shipping)
admin.site.register(PaymentType)
admin.site.register(Stripe)
admin.site.register(PayPal)
admin.site.register(Payment)
admin.site.register(PurchaseHistory)
