import datetime

def validate_date(date_text):
    try:
        return date_text and datetime.datetime.strptime(date_text, '%B %d, %Y').date()
    except ValueError:
        return

def validate_cc_date(date_text):
    try:
        return date_text and datetime.datetime.strptime(date_text, '%m/%y').date()
    except ValueError:
        return
