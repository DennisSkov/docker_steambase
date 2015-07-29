FROM debian:jessie
MAINTAINER Donavan Stanley <donavan.stanley@gmail.com>

RUN mkdir -p /opt/steam/servers


VOLUME ["/opt/steam/save"]

RUN apt-get update
RUN apt-get install -y wget


RUN useradd -ms /bin/bash steam

RUN mkdir /home/steam/steamcmd
WORKDIR /home/steam/steamcmd
RUN wget https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz
RUN tar -xvzf steamcmd_linux.tar.gz
RUN chown -R steam:steam /home/steam/steamcmd
RUN chown -R steam:steam /opt/steam
USER steam

