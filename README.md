# Docker-MOHAA-server
Docker MOHAA server including volume to add contents

Based on the work of solipsist01: https://github.com/solipsist01/dockerfiles/tree/master/mohaa

Someone asked for a way to run this MOHAA Docker server while beeing abble to add some contents such as maps, skins...

I added a MOUNT volume, cron and a cronjob that copy files from local volume to the /app (workdir that can't be mounted) and a startup script to launch the game and cron.

Tested on Linux Ubuntu/Debian.

**How to use**
Clone this repo: 
Build the Docker: 
```

```
Run it:
```docker run -d \
--name=mohaa \
--restart always \
-p 12203:12203/udp \
-p 12300:12300/udp \
-v /home/aerya/docker/mohaa/config:/config \
-v /home/aerya/docker/mohaa/stuff:/stuff \
aerya/mohaatesting:latest```
