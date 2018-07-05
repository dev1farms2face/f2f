from social.backends.facebook import FacebookOAuth2


class FacebookOauth2Custom(FacebookOAuth2):
    REDIRECT_STATE = False