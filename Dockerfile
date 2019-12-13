FROM alpine:latest

LABEL maintainer="Rom1 <rom1@canel.ch> - CANEL https://www.canel.ch"
LABEL date=""
LABEL version=""
LABEL description=""

RUN apk update \
 && apk add tzdata

ENV TIMEZONE="Europe/Zurich"

RUN echo $TIMEZONE > /etc/timezone \
 && ln -sf /usr/share/zoneinfo/$(echo $TIMEZONE|cut -d'/' -f1)/$(echo $TIMEZONE|cut -d'/' -f2) \
           /etc/localtime
