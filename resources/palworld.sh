#!/bin/bash

INSTALL_DIR=/home/steam/palworld

cd /home/steam/steamcmd

./steamcmd.sh +force_install_dir $INSTALL_DIR +login anonymous +app_update 2394010 +quit

GAMECONFIG_DIR=$INSTALL_DIR/PalServer/Pal/Saved/Config/LinuxServer

mkdir -p $GAMECONFIG_DIR

if ! [ -f $GAMECONFIG_DIR/PalWorldSettings.ini ]; then
    cp -f $INSTALL_DIR/DefaultPalWorldSettings.ini $GAMECONFIG_DIR/PalWorldSettings.ini
fi

if ! [ -s $GAMECONFIG_DIR/PalWorldSettings.ini ]; then
    cp -f $INSTALL_DIR/DefaultPalWorldSettings.ini $GAMECONFIG_DIR/PalWorldSettings.ini
fi

cd $INSTALL_DIR

./PalServer.sh -useperfthreads -NoAsyncLoadingThread -UseMultithreadForDS