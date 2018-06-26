from django.contrib import admin

from .models import *
from userregistration.models import *

admin.site.register(Shipping)
admin.site.register(PaymentType)
admin.site.register(Stripe)
admin.site.register(PayPal)
admin.site.register(Payment)
admin.site.register(Promo)
#admin.site.register(PurchaseHistory)

class PurchaseHistoryAdmin(admin.ModelAdmin):
    readonly_fields = ('shippingaddress','details',)
    def shippingaddress(self, obj):
        return obj.shippingaddress()
    def details(self, obj):
        return obj.details()

admin.site.register(PurchaseHistory, PurchaseHistoryAdmin)
