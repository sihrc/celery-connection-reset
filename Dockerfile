FROM alpine

LABEL author="Chris Lee"
LABEL email="chris@indico.io"

COPY requirements.txt /requirements.txt
RUN apk update && \
    apk add --no-cache build-base \
    python3-dev \
    python3 \
    bash && \
    python3 -m ensurepip && \
    if [ ! -e /usr/bin/pip ]; then ln -s pip3 /usr/bin/pip ; fi && \
    if [[ ! -e /usr/bin/python ]]; then ln -sf /usr/bin/python3 /usr/bin/python; fi && \
    pip3 install --upgrade pip wheel && \
    rm -r /root/.cache && \
    pip3 install -r requirements.txt && \
    pip3 install gevent && \
    wget https://raw.githubusercontent.com/celery/celery/master/extra/generic-init.d/celeryd -O /etc/init.d/celeryd && \
    chmod +x /etc/init.d/celeryd && ln -s /etc/init.d/celeryd /usr/bin/celeryd

COPY . /app
WORKDIR /app

RUN python3 setup.py develop

CMD ["bash"]