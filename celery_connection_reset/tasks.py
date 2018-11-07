from celery_connection_reset.celery_app import CELERY_APP

@CELERY_APP.task
def add(a, b):
    return a + b