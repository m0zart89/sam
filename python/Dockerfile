FROM python:3.8

ARG SRC_DIR=/usr/bin/src/webapp/src
COPY service.py ${SRC_DIR}/
WORKDIR ${SRC_DIR}

ENV PYTHONUNBUFFERED=1

CMD ["python3", "service.py"]
