FROM debian:jessie
MAINTAINER Donavan Stanley <donavan.stanley@gmail.com>

RUN mkdir -p /opt/steam/servers


VOLUME ["/opt/steam/save"]

RUN apt-get update
RUN apt-get install -y wget lib32stdc++6


RUN useradd -ms /bin/bash steam

# Install SteamCMD, being done as root due to a permissions error I haven't nailed down while doing it as steam
RUN mkdir /home/steam/steamcmd
WORKDIR /home/steam/steamcmd
RUN wget https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz
RUN tar -xvzf steamcmd_linux.tar.gz
RUN chown -R steam:steam /home/steam/steamcmd
RUN chown -R steam:steam /opt/steam
ADD install_steam_app /usr/local/bin/install_steam_app

# Switch over to the steam user for the rest
USER steam

# Launch SteamCMD once because it will install an update even though we just downloaded the damn thing
RUN /home/steam/steamcmd/steamcmd.sh +login anonymous +quit

