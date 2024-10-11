#!/bin/sh
sudo docker compose pull
sudo docker compose up -d --remove-orphans
yes | sudo docker image prune
if [ $? -ne 0 ]
   then
	echo failed
   else
	echo success
fi
