#! /bin/bash
chown root '/etc/default/celeryd'
celeryd start
tail -F /var/log/celery.log
