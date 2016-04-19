#/bin/bash
if [ $1 ]
  then
    DOCKER_STEAM_TAG=$1
fi

if [ -z $DOCKER_STEAM_TAG ]
  then
    DOCKER_STEAM_TAG="jdonavan/steambase"
fi

docker run --net="bridge" -v ~/.ark_inabox/workshop:/opt/steam/workshop -v  ~/.ark_inabox/mods:/opt/steam/mods -i -t $DOCKER_STEAM_TAG /bin/bash

