FROM debian:jessie
MAINTAINER Donavan Stanley <donavan.stanley@gmail.com>

RUN mkdir -p /opt/steam/servers

VOLUME ["/opt/steam/save"]

RUN apt-get update
RUN apt-get install -y wget lib32stdc++6

RUN useradd -ms /bin/bash steam

# Install SteamCMD
RUN mkdir /home/steam/steamcmd
WORKDIR /home/steam/steamcmd

RUN wget https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz
RUN tar -xvzf steamcmd_linux.tar.gz
RUN rm steamcmd_linux.tar.gz

RUN chown -R steam:steam /home/steam/steamcmd
RUN chown -R steam:steam /opt/steam

# Install our helper tools
ADD install_steam_app /usr/local/bin/install_steam_app
ADD install_steam_mod /usr/local/bin/install_steam_mod

# Switch over to the steam user for the rest
USER steam

# Launch SteamCMD once because so it can update if needed
RUN /home/steam/steamcmd/steamcmd.sh +login anonymous +quit

