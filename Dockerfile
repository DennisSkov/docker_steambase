FROM debian:jessie
MAINTAINER Donavan Stanley <donavan.stanley@gmail.com>

VOLUME ["/var/lib/steam_save"]

RUN apt-get update
RUN apt-get install -y wget


RUN useradd -ms /bin/bash steam

RUN mkdir /home/steam/steamcmd
RUN wget https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz
RUN tar -xvzf steamcmd_linux.tar.gz
RUN chown -R steam:steam /home/steam/steamcmd
USER steam

