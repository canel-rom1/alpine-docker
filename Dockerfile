FROM alpine:3.11.5

LABEL maintainer="Rom1 <rom1@canel.ch> - CANEL https://www.canel.ch"
LABEL date="23/04/2020"
LABEL version=""
LABEL description="Alpine avec une configuration personnalisée"

RUN apk update \
 && apk add tzdata \
 && rm -rf /var/cache/apk/*

ENV TIMEZONE="Europe/Zurich"

RUN echo $TIMEZONE > /etc/timezone \
 && ln -sf /usr/share/zoneinfo/$(echo $TIMEZONE|cut -d'/' -f1)/$(echo $TIMEZONE|cut -d'/' -f2) \
           /etc/localtime
