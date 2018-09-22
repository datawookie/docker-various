Things to do:

	1. Change from dirtydy to SQLite3.

Cloned from ether/etherpad-docker.git

# etherpad-docker

## Building

`sudo docker build -t etherpad .`

## Running

This is a Docker image which is nothing more than the basic test Etherpad setup as described on https://github.com/ether/etherpad-lite.
(All of these instructions are as root.) To download the image from the Docker index, run:

`sudo docker pull datawookie/etherpad`

To run Etherpad on port 9001, run:

`sudo docker run -d -p 9001:9001 datawookie/etherpad`

To run Etherpad on port 80, run:

`sudo docker run -d -p 80:9001 datawookie/etherpad`

To edit the Etherpad settings.json, it is necessary to clone the Git repository:

`git clone git@github.com:DataWookie/docker-etherpad.git && cd docker-etherpad`

Then edit the settings.json to your liking and rebuild the image.
