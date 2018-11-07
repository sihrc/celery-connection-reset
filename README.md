# celery_connection_reset
Reproducing race condition from celery redis backend

Built on: Python3 and Docker (alpine)<br>
Maintained by: Chris Lee [chris@indico.io]

## Getting Started
```bash
docker-compose up --build
```

```
docker exec -it celery_connection_reset_app_1 bash
python3 -m celery_connection_reset.app 5
python3 -m celery_connection_reset.app 100
python3 -m celery_connection_reset.app 1000 # Errors out on more
```
