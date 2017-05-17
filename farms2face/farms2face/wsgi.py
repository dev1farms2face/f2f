"""
WSGI config for farms2face project.

It exposes the WSGI callable as a module-level variable named ``application``.

For more information on this file, see
https://docs.djangoproject.com/en/1.10/howto/deployment/wsgi/
"""

import os
#import sys

from django.core.wsgi import get_wsgi_application

#sys.path.insert(0, '/home/ec2-user/farms2face/f2f/farms2face')
os.environ.setdefault("DJANGO_SETTINGS_MODULE", "farms2face.settings")

application = get_wsgi_application()
