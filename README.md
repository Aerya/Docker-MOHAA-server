# Docker-MOHAA-server
Docker MOHAA 1.12 Reborn server including volume to add contents such as maps, skins...

* Based on the work of solipsist01: https://github.com/solipsist01/
* https://upandclear.org/2021/11/01/serveur-mohaa-reborn-en-docker/
* https://hub.docker.com/r/aerya/mohaa-server-volume-enabled


Tested on Linux Ubuntu/Debian.

Game root folder (/app) is a WORKDIR in Docker so it can't be mounted locally (VOLUME). Thus we couldn't add maps or whatever easily.
I added:
 - /stuff folder as a VOLUME (aka you can mount it locally)
 - cron and a cronjob so as every minute any file/folder in /stuff will be copied to /app
 - new startup script to launch game server and start cron

Not the smartest but the easiest to me.

GL HF!!



```
docker run -d \
--name=mohaa \
--restart always \
-p 12203:12203/udp \
-p 12300:12300/udp \
-e TZ=Europe/Paris \
-v /home/aerya/docker/mohaa/config:/config \
-v /home/aerya/docker/mohaa/stuff:/stuff \
aerya/mohaa-server-volume-enabled:latest
```

* /config = game server config (config.cfg)
* /stuff = add maps or whatever

Reported to work on Synology.
