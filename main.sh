#!/bin/bash

#update apt index
sudo apt-get update

#automatic install of docker
curl -fsSL test.docker.com -o get-docker.sh && sh get-docker.sh

#add pi to docker group
sudo usermod -aG docker pi

#portainer volume create
sudo docker volume create portainer_data

#portainer-ce install
sudo docker run -d -p 8000:8000 -p 9443:9443 --name portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce:linux-arm

#message
ip=$(hostname -I | awk '{print $1}')
port="9443"

printf "You can access Portainer at https://%s:%s\n" "$ip" "$port"
