"""farms2face URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/1.10/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  url(r'^$', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  url(r'^$', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.conf.urls import url, include
    2. Add a URL to urlpatterns:  url(r'^blog/', include('blog.urls'))
"""
from django.conf.urls import url, include
from django.contrib import admin
from django.conf import settings
from django.conf.urls.static import static
from django.contrib.auth.views import logout
import facepackwizard.views
import home.views
import cart.views
import myaccount.views
import reviews.views

admin.autodiscover()

urlpatterns = [
    url(r'^admin/', admin.site.urls),
    url(r'^cart/', include('cart.urls')),
    url(r'^register/', include('userregistration.urls')),
    url(r'^post_change_password/', home.views.post_change_password, name='forgot'),
    url(r'^post_forgot/', home.views.forgot_pass, name='forgot'),
    url(r'^forgot/(?P<key>[\w+\-]+)', home.views.change_pass, name='change'),
    url(r'^$|^home/$|^home/shop/|^home/process/', include('home.urls')),
    url(r'^prepacks/(?P<id>\d+)/', include('prepacks.urls')),
    url(r'^wizard/', include('facepackwizard.urls')),
    url(r'^wizard/results/', facepackwizard.views.results),
    url(r'^subscribe/', include('subscriptions.urls')),
    url(r'^payments/', include('payments.urls')),
    url(r'^story/', include('story.urls')),
    url(r'^reviews/$', reviews.views.review_page),
    url(r'^reviews/(?P<skin_type>\w+)/', reviews.views.review_page),
    url(r'^faq/', home.views.faq, name='faq'),
    url(r'^disclaimer/', home.views.disclaimer, name='disclaimer'),
    url(r'^contactus/', home.views.contactus, name='contactus'),
    url(r'^privacy/', home.views.privacy, name='privacy'),
    url(r'^signin/$', home.views.login_page, name='login'),
    url(r'^signin/(?P<new>\w+)/$', home.views.login_page, name='login'),
    url(r'^post_login_user/', home.views.login_user, name='login'),
    url(r'^logout/', home.views.logout_user, name='logout'),
    #url(r'^logout/$', logout, {'next_page': '/signin'}, name='logout'),
    url(r'^post_update_cart_type/', cart.views.update_type),
    url(r'^post_update_cart_quantity/', cart.views.update_quantity),
    url(r'^post_wizard_submit/', facepackwizard.views.wizard_submit),
    url(r'^post_add_cart/', home.views.post_add_cart),
    url(r'^post_remove_cart/', home.views.post_remove_cart),
    url(r'^post_checkout/', cart.views.checkout),
    url(r'^post_save_myaccount_details/', myaccount.views.save_myaccount_details),
    url(r'^post_save_shipping_address/', myaccount.views.save_shipping_address),
    url(r'^post_update_shipping_address/', myaccount.views.update_shipping_address),
    url(r'^post_delete_shipping_address/', myaccount.views.delete_shipping_address),
    url(r'^post_save_paymenttype/', myaccount.views.save_paymenttype),
    url(r'^post_delete_paymenttype/', myaccount.views.delete_paymenttype),
    url(r'^post_photo_upload/', myaccount.views.photo_upload),
    url(r'^post_update_ph/', myaccount.views.update_ph),
    url(r'^post_save_review/', myaccount.views.save_review),
    url(r'^post_delete_review/', myaccount.views.delete_review),
    url(r'^post_delete_review_pic/', myaccount.views.delete_review_pic),
    url(r'^get_review/(?P<review_id>\d+)/$', myaccount.views.get_review),
    url(r'^thanks/', cart.views.thanks),
    url(r'^myaccount/$', myaccount.views.view_myaccount),
    url(r'^myaccount/(?P<option>[^/]+)/$', myaccount.views.view_myaccount),
    url(r'^post_upload_review_pic/', myaccount.views.review_photo_upload),
    url(r'^post_associate_review_pic/', myaccount.views.review_uploaded_photo_associate),
    url(r'^post_vote/', reviews.views.vote),
    url('', include('social.apps.django_app.urls', namespace='social')),
    url('', include('django.contrib.auth.urls', namespace='auth')),
] + static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
