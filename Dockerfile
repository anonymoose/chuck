
FROM python:3 as builder

RUN useradd -ms /bin/bash -u 4200 devops
USER devops
WORKDIR /home/devops

COPY requirements.txt ./

RUN pwd && python -m venv venv \
    && . venv/bin/activate \
    && which pip \
    && python --version \
    && pip install --upgrade pip \
    && pip install -r requirements.txt

COPY ./bin ./bin
COPY ./chuck ./chuck

CMD [ "bin/docker-entrypoint" ]
