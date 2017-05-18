from django import template

register = template.Library()

@register.filter
def make_label(value):
    return value.upper().replace("-"," ")
