#!/bin/bash

DATAPATH=/data

PROFILE=profiles/car.lua

# Extract road network.
#
osrm-extract $DATAPATH/$1 -p $PROFILE

# Create the hierachy.
#
osrm-contract $DATAPATH/$1.osrm

# Start server.
#
osrm-routed $DATAPATH/$1.osrm &

server=$!

_sig() {
  kill -TERM $server 2>/dev/null
}

trap _sig SIGKILL SIGTERM SIGHUP SIGINT EXIT

wait "$server"

rm $DATAPATH/$1.osrm*