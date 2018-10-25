
FROM python:3.7-alpine

RUN apk update && \
    apk add --no-cache \
        bind-tools \
        net-tools \
        curl \
        bash \
        ca-certificates && \
    update-ca-certificates && \
    mkdir /lib64 && \
    ln -s /lib/libc.musl-x86_64.so.1 /lib64/ld-linux-x86-64.so.2

RUN adduser -D -g "" devops && \
    mkdir -p /home/devops && \
    chown -R devops /home/devops

USER devops
WORKDIR /home/devops

COPY requirements.txt ./

RUN pwd && df -h && python -m venv venv \
    && . venv/bin/activate \
    && which pip \
    && python --version \
    && pip install --upgrade pip \
    && pip install -r requirements.txt

COPY ./bin ./bin
COPY ./chuck ./chuck

EXPOSE 8080
ENTRYPOINT [ "/home/devops/bin/docker-entrypoint" ]

