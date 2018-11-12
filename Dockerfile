FROM python:3.6-alpine

RUN adduser -D subscriber

WORKDIR /home/subscriber

COPY requirements.txt requirements.txt
RUN python -m venv venv
RUN venv/bin/pip install -r requirements.txt
RUN venv/bin/pip install gunicorn

COPY app app
COPY run.sh subscriber.py ./
RUN chmod +x run.sh

ENV FLASK_APP subscriber.py

RUN chown -R subscriber:subscriber ./
USER subscriber

EXPOSE 5000
ENTRYPOINT ["./run.sh"]