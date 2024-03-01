FROM ubuntu

MAINTAINER test

RUN apt-get update

COPY test.sh home/

RUN chmod 755 home/test.sh
