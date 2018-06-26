"""
Django settings for farms2face project.

Generated by 'django-admin startproject' using Django 1.10.5.

For more information on this file, see
https://docs.djangoproject.com/en/1.10/topics/settings/

For the full list of settings and their values, see
https://docs.djangoproject.com/en/1.10/ref/settings/
"""

import os
"""
import os, sys
print("__name__ =", __name__)
print("__file__ =", __file__)
print("os.getpid() =", os.getpid())
print("os.getcwd() =", os.getcwd())
print("os.curdir =", os.curdir)
print("sys.path =", repr(sys.path))
print("sys.modules.keys() =", repr(sys.modules.keys()))
print("sys.modules.in('farms2face') =", 'farms2face' in sys.modules)
if 'farms2face' in sys.modules:
  print("sys.modules['farms2face'].__name__ =", sys.modules['farms2face'].__name__)
  print("sys.modules['farms2face'].__file__ =", sys.modules['farms2face'].__file__)
  print("os.environ['DJANGO_SETTINGS_MODULE'] =", os.environ.get('DJANGO_SETTINGS_MODULE', None))
"""


# Build paths inside the project like this: os.path.join(BASE_DIR, ...)
BASE_DIR = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))

EMAIL_BACKEND = 'django.core.mail.backends.smtp.EmailBackend'
if 'DEV' in os.environ:
    EMAIL_USE_TLS = True
    EMAIL_HOST = 'smtp.gmail.com'
    EMAIL_HOST_PASSWORD = 'farms2face' #my gmail password
    EMAIL_HOST_USER = 'farms2face@gmail.com' #my gmail username
    DEFAULT_FROM_EMAIL = EMAIL_HOST_USER
    EMAIL_PORT = 587
    DEBUG = True
else:
    EMAIL_HOST = '127.0.0.1'
    EMAIL_HOST_USER = 'no-reply@farms2face.com' #my gmail username
    DEFAULT_FROM_EMAIL = EMAIL_HOST_USER
    EMAIL_USE_TLS = False
    DEBUG = True

SESSION_SAVE_EVERY_REQUEST = True

SESSION_ENGINE = "django.contrib.sessions.backends.file"

SESSION_COOKIE_AGE = 10 * 60 

# Quick-start development settings - unsuitable for production
# See https://docs.djangoproject.com/en/1.10/howto/deployment/checklist/

# SECURITY WARNING: keep the secret key used in production secret!
SECRET_KEY = 'fpit^azx93lk^w6vq=o245=3%p%@yw+pr&x)^hmpo5p2w!%b1x'

if 'DEV' in os.environ:
    SOCIAL_AUTH_FACEBOOK_KEY = '114214335784895'
    SOCIAL_AUTH_FACEBOOK_SECRET = '6205f0f214c26c2c3897b8008d6e3c6f' 
else:
    SOCIAL_AUTH_FACEBOOK_KEY = '1012029478898104'
    SOCIAL_AUTH_FACEBOOK_SECRET = '42eab4156d0c9d134147c1c66b75c20a'  

# Stripe API KEY

STRIPE_API_KEY = "sk_test_7hvmBNodLNQanNdNLaeXIy0O"  # Test
if 'STRIPE_API_KEY' in os.environ:
    STRIPE_API_KEY = os.environ['STRIPE_API_KEY']

# SECURITY WARNING: don't run with debug turned on in production!

ALLOWED_HOSTS = ['127.0.0.1', 'www.rajiv.com', 'www.farms2face.com', 'farms2face.com', 'farms2face-env.us-west-1.elasticbeanstalk.com']

# Application definition

INSTALLED_APPS = [
    'social.apps.django_app.default',
    'home.apps.HomeConfig',
    'payments.apps.PaymentsConfig',
    'facepackwizard.apps.FacepackwizardConfig',
    'prepacks.apps.PrepacksConfig',
    'subscriptions.apps.SubscriptionsConfig',
    'userlogs.apps.UserlogsConfig',
    'userregistration.apps.UserregistrationConfig',
    'myaccount.apps.MyaccountConfig',
    'cart.apps.CartConfig',
    'story.apps.StoryConfig',
    'reviews.apps.ReviewsConfig',
    'django.contrib.admin',
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.messages',
    'django.contrib.staticfiles',
    'django_extensions',
]


AUTHENTICATION_BACKENDS = (
    'social.backends.facebook.FacebookOAuth2',
    #'social.backends.google.GoogleOAuth2',
    #'social.backends.twitter.TwitterOAuth',
    'django.contrib.auth.backends.ModelBackend',
)

MIDDLEWARE = [
    'django.middleware.security.SecurityMiddleware',
    'django.contrib.sessions.middleware.SessionMiddleware',
    'django.middleware.common.CommonMiddleware',
    'django.middleware.csrf.CsrfViewMiddleware',
    'django.contrib.auth.middleware.AuthenticationMiddleware',
    'django.contrib.messages.middleware.MessageMiddleware',
    'django.middleware.clickjacking.XFrameOptionsMiddleware',
]

SOCIAL_AUTH_FACEBOOK_API_VERSION = '2.12'
SOCIAL_AUTH_USERNAME_IS_FULL_EMAIL = True
SOCIAL_AUTH_LOGIN_REDIRECT_URL = '/home/'
SOCIAL_AUTH_LOGIN_ERROR_URL = '/home/'
SOCIAL_AUTH_FACEBOOK_SCOPE = ['email']
SOCIAL_AUTH_USER_FIELDS = ['email', 'username']
SOCIAL_AUTH_FACEBOOK_PROFILE_EXTRA_PARAMS = {
    'fields': 'id,name,email', 
}

SOCIAL_AUTH_PIPELINE = (
    'social.pipeline.social_auth.social_details',
    'social.pipeline.social_auth.social_uid',
    'social.pipeline.social_auth.auth_allowed',
    # Path to your overrided method
    # You can set any other valid path.
    'home.views.social_user',
    'social.pipeline.user.get_username',
    'social_core.pipeline.social_auth.associate_by_email',
    'social.pipeline.user.create_user',
    'social.pipeline.social_auth.associate_user',
    'social.pipeline.social_auth.load_extra_data',
    'social.pipeline.user.user_details',
    'home.views.rename_social_anon_user',
    'home.views.save_profile_picture',
    'home.views.redirect_next',
)

ROOT_URLCONF = 'farms2face.urls'

TEMPLATES = [
    {
        'BACKEND': 'django.template.backends.django.DjangoTemplates',
        'DIRS': [],
        'APP_DIRS': True,
        'OPTIONS': {
            'context_processors': [
                'django.template.context_processors.debug',
                'django.template.context_processors.request',
                'django.contrib.auth.context_processors.auth',
                'django.contrib.messages.context_processors.messages',
                'social.apps.django_app.context_processors.backends',
                'social.apps.django_app.context_processors.login_redirect',
            ],
        },
    },
]

WSGI_APPLICATION = 'farms2face.wsgi.application'


# Database
# https://docs.djangoproject.com/en/1.10/ref/settings/#databases

if 'RDS_DB_NAME' in os.environ:
    DATABASES = {
        'default': {
            'ENGINE': 'django.db.backends.mysql',
            'NAME': os.environ['RDS_DB_NAME'],
            'USER': os.environ['RDS_USERNAME'],
            'PASSWORD': os.environ['RDS_PASSWORD'],
            'HOST': os.environ['RDS_HOSTNAME'],
            'PORT': os.environ['RDS_PORT'],
        }
    }
else:
    DATABASES = {
        'default': {
            'ENGINE': 'django.db.backends.mysql',
            'NAME': 'farms2face',
	    'USER': 'django',
	    'PASSWORD': 'django',
	    'HOST': '127.0.0.1',
	    'PORT': '3306',
        }
    }

"""
DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.mysql',
        'NAME': 'txciggy$farms2face',
        'USER': 'txciggy',
        'PASSWORD': 'farms2face',
        'HOST': 'txciggy.mysql.pythonanywhere-services.com',
        'PORT': '3306',
    }
}
"""

# Password validation
# https://docs.djangoproject.com/en/1.10/ref/settings/#auth-password-validators

AUTH_PASSWORD_VALIDATORS = [
    {
        'NAME': 'django.contrib.auth.password_validation.UserAttributeSimilarityValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.MinimumLengthValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.CommonPasswordValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.NumericPasswordValidator',
    },
]


# Internationalization
# https://docs.djangoproject.com/en/1.10/topics/i18n/

LANGUAGE_CODE = 'en-us'

TIME_ZONE = 'PST8PDT'

USE_I18N = True

USE_L10N = True

USE_TZ = True


# Static files (CSS, JavaScript, Images)
# https://docs.djangoproject.com/en/1.10/howto/static-files/

"""
STATIC_URL = '/static/'
MEDIA_ROOT = '/usr/local/projects/farms2face/files/'
MEDIA_URL = '/images/'
"""

STATIC_ROOT = '/home/ec2-user/farms2face/f2f/farms2face/static/'
STATIC_URL = '/static/'
MEDIA_ROOT = '/home/ec2-user/farms2face/f2f/farms2face/files' 
MEDIA_URL = '/images/'   

STATIC_ROOT = os.path.join(BASE_DIR, "static")
STATIC_URL = '/static/'
MEDIA_ROOT = os.path.join(BASE_DIR, "files")
MEDIA_URL = '/images/'   