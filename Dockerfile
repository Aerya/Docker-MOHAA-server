FROM debian:10-slim
MAINTAINER Aerya | upandclear.org | Based on https://github.com/solipsist01

RUN dpkg --add-architecture i386 \
    && apt-get update \
    && apt-get -y install libstdc++5 libstdc++5:i386 \
    && mkdir /app && mkdir /config

ADD mohaa_mini /app
WORKDIR /app
RUN chmod 777 /app/mohaa_lnxded && chmod 777 /app/init.sh

# Cron related
RUN apt-get -y install cron
COPY copystuff /etc/cron.d/copystuff
RUN chmod 0777 /etc/cron.d/copystuff
RUN crontab /etc/cron.d/copystuff

# Stuff related
RUN mkdir /stuff
VOLUME /stuff

# Game and cron start
COPY startup.sh /app
RUN chmod 777 /app/startup.sh
CMD /app/startup.sh
