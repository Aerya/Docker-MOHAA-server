# Docker-MOHAA-server
Docker MOHAA 1.12 Reborn server including volume to add contents such as maps, skins...

Based on the work of solipsist01: https://github.com/solipsist01/
MOHAA Reborn: https://x-null.net/wiki/index.php?title=Medal_of_Honor:_AA_Reborn_Patch#Why_did_you_call_it_Reborn.3F


Tested on Linux Ubuntu/Debian.

Game root folder (/app) is a WORKDIR in Docker so it can't be mounted locally (VOLUME). Thus we can't add maps or whatever easily.
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

/config = game server config (config.cfg)

/stuff = add maps or whatever
