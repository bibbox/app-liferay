#!/bin/bash
echo "Starting Scaleus Container!"

. defaultvar.sh

#Startu Up
java -jar /opt/scaleus/scaleus-1.0-jar-with-dependencies.jar -p "$SCALEUS_PORT"