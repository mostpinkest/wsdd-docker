FROM python:3-alpine

WORKDIR /usr/src/app

RUN apk add --no-cache curl bash && curl https://raw.githubusercontent.com/christgau/wsdd/master/src/wsdd.py -o wsdd.py && apk del curl

COPY docker-cmd.sh .

ENTRYPOINT [ "./docker-cmd.sh"]
