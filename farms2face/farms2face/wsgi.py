"""
WSGI config for farms2face project.

It exposes the WSGI callable as a module-level variable named ``application``.

For more information on this file, see
https://docs.djangoproject.com/en/1.10/howto/deployment/wsgi/
"""

import os
"""
print '===== sys.path / PYTHONPATH ====='
for k in sorted(os.environ.keys()):
    v = os.environ[k]
    print ('%-30s %s' % (k,v[:70]))

"""
import sys

sys.path.append('/home/ec2-user/farms2face/f2f/farms2face')
sys.path.append('/home/ec2-user/f2f/lib/python3.6/site-packages')

from django.core.wsgi import get_wsgi_application

#sys.path.insert(0, '/home/ec2-user/farms2face/f2f/farms2face')
os.environ.setdefault("DJANGO_SETTINGS_MODULE", "farms2face.settings")

application = get_wsgi_application()
