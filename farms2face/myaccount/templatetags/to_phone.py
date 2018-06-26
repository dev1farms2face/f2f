from django import template

register = template.Library()

@register.filter
def to_phone(value):
    if value and len(value) == 10:
        return '('+value[0:3]+') '+value[3:6]+' '+value[6:]
    return value
