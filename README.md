# roon-httpAPI-docker-rpi
Raspberry pi docker container for the roon http api, based on https://github.com/Keesromkes/roon-extension-http-api

_Please note, it's my first node project and also the docker container is not a very experienced one -- but I've tried and succeeded on my environment. Feel free to add pull requests to optimise._

[![Docker Stars](https://img.shields.io/docker/stars/keesromkes/roonhttpapi.svg)](https://cloud.docker.com/u/keesromkes/repository/docker/keesromkes/roonhttpapi)
[![Docker Pulls](https://img.shields.io/docker/pulls/keesromkes/roonhttpapi.svg)](https://cloud.docker.com/u/keesromkes/repository/docker/keesromkes/roonhttpapi)
![Docker Cloud Automated build](https://img.shields.io/docker/cloud/automated/keesromkes/roonhttpapi)
![Docker Cloud Build Status](https://img.shields.io/docker/cloud/build/keesromkes/roonhttpapi)

* [This project on Docker](https://cloud.docker.com/repository/docker/keesromkes/roonhttpapi)
* [This project on Github](https://github.com/Keesromkes/roon-httpAPI-docker-rpi)

## Why use environment variables to set server and port
Since I'm not sure what ports to open to allow automatic discovery, you'll need to set the environment variables in docker-compose to match your environment.

Contents of the ```.env``` file:
```env
server=192.168.86.222
port=9100
```

Of course replace specifically for yourself.

## using docker-compose to get going
I've used docker-compose to make sure that I don't ever forget everything while starting the container, and obviously also restart it whenever needed. 

To start the container using docker-compose:

```bash
docker-compose up -d
```

If you feel adventerous and just want to run it on the commandline with docker (or you don't care about docker-compose)

```bash
docker run -d -e server:192.168.86.222 -e port:9100 keesromkes/roonhttpapi
```

### changes from the roon-extension-http-api by @st0g1e
1. Added the option to set the environment variables as mentioned above. If server is not set, it will just turn to auto discovery
2. Added ```/roonAPI/getInternetRadios``` API to get to internetradio stations specifically. The original browse API supplied by @st0g1e didn't completely work for me, and I was curious about learning node.
  1. ```toSearch``` parameter allows you to specify the title of a specific internet radio station, it is **case sensitive**!
  2. ```zone``` parameter allows to set a specific zoneID, as would expected. I've added some constants in the code to reflect my personal environment, I don't like ID's that much.
  3. Only one station will be returned and played automatically, if it returns more than 1 result, it won't do anything currently.
3. Example query that plays a radio station in my environment: 

```bash 
localhost:3001/roonAPI/getInternetRadios?toSearch=Kink&zone=Marantz
```

### Useful links:
1. [Roon extension HTTP API](https://github.com/Keesromkes/roon-extension-http-api)
2. [Roon forum post where it all started[(https://github.com/Keesromkes/roon-extension-http-api)
