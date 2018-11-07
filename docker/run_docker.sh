#! /bin/bash
docker build -t celery_connection_reset .
docker stop celery_connection_reset
docker rm celery_connection_reset
docker run -v $(pwd):/celery_connection_reset --name {[package}} -dt celery_connection_reset bash
docker exec -it celery_connection_reset bash
