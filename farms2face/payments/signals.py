from django.db.models.signals import post_save, post_init
from django.dispatch import receiver
from payments.models import PurchaseHistory
import farms2face.settings as settings
from django.template.loader import render_to_string
from home.templatetags.common_tags import facepack_display_abs
from django.core.mail import EmailMultiAlternatives
import pdb
import datetime
import re
from django.contrib.auth.models import User

@receiver(post_init, sender=PurchaseHistory)
def remember_tracking(sender, instance, **kwargs):
    instance.prev_tracking = instance.tracking

@receiver(post_save, sender=PurchaseHistory)
def mail_tracking_updates(sender, instance, **kwargs):
    ph = instance
    if ph.tracking and ph.prev_tracking != ph.tracking:
        payment = ph.payment
        user = ph.user
        to_email = ph.user.email
        from_email = 'no-reply@farms2face.com'
        text_content = "Tracking Update"
        html_content = "<h2>Good News - Your FaceMask has been shipped!</h2>"
        #url = request.get_raw_uri().replace(request.get_full_path(),'')
        url = "https://www.farms2face.com"
        html_content += "<hr>"+render_to_string('facepack_mail.html', facepack_display_abs(url, ph.item.id))
        html_content += "<p>Type: <b>%s</b></p>" % "A-LA-CARTE" if ph.type == "buy" else "NEVER RUN OUT"
        html_content += "<p>Qty: <b>%d</b></p>" % ph.quantity
        html_content += "<p>Price: <b>$%0.2f</b></p>" % ph.item.price
        html_content += "<hr><h3>Ordered by: %s</h3>" % user.email
        html_content += "<hr><h3>Tracking Number: %s</h3>" % ph.tracking 
        html_content_admin = html_content
        html_content = re.sub('<a.*a>','', html_content)
        msg = EmailMultiAlternatives('Tracking Update #%d - Farms2Face' % ph.id, text_content, from_email, [to_email])
        msg.attach_alternative(html_content, "text/html")
        msg.send()

        # Send email to admin with links
        msg = EmailMultiAlternatives('Admin - Tracking Update #%d - Farms2Face' % ph.id, text_content, from_email,
              [i['email'] for i in User.objects.filter(is_superuser=True).values('email')])
        msg.attach_alternative(html_content_admin, "text/html")
        msg.send()


