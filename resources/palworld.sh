#!/bin/bash

INSTALL_DIR=/home/steam/palworld

cd /home/steam/steamcmd

./steamcmd.sh +force_install_dir $INSTALL_DIR +login anonymous +app_update 2394010 +quit

GAMECONFIG_DIR=$INSTALL_DIR/PalServer/Pal/Saved/Config/LinuxServer

mkdir -p $GAMECONFIG_DIR

touch $GAMECONFIG_DIR/PalWorldSettings.ini

cd $INSTALL_DIR

./PalServer.sh -useperfthreads -NoAsyncLoadingThread -UseMultithreadForDS