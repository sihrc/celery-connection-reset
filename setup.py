#!/usr/bin/env python
import os
from setuptools import setup, find_packages

setup(
    name='celery_connection_reset',
    version='0.1',
    description='Reproducing gevent amqp connection reset',
    author='Chris Lee',
    author_email='chris@indico.io',
    packages=find_packages(),
    install_requires=open(
        os.path.join(
            os.path.dirname(__file__),
            "requirements.txt"
        ),
        'r'
    ).readlines()
)
