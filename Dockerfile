FROM debian:jessie

MAINTAINER Joeri Verdeyen <joeriv@yappa.be>

ENV HTTP_PORT 1080
ENV SMTP_PORT 1025

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -q -y \
    libsqlite3-dev \
    ruby \
    ruby-dev \
    build-essential && \
    gem install --no-ri --no-rdoc mailcatcher --version 0.5.12 && \
    apt-get remove -y build-essential && \
    apt-get autoremove -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists

RUN echo Europe/Brussels > /etc/timezone && dpkg-reconfigure --frontend noninteractive tzdata

EXPOSE 1080 1025

ENTRYPOINT ["mailcatcher", "--smtp-ip=0.0.0.0", "--http-ip=0.0.0.0", "--http-port=$HTTP_PORT", "--smtp-port=$SMTP_PORT", "--foreground"]
