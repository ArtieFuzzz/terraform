#!/bin/bash

### Update local packages, etc
sudo apt-get update -y
sudo apt-get upgrade -y

### Install NGINX
sudo apt-get install nginx -y

### Update Git

add-apt-repository -y ppa:git-core/ppa
apt-get update -y
apt-get upgrade -y

### Install NodeJS

curl -fsSL https://deb.nodesource.com/setup_17.x | sudo -E bash -
apt install -y nodejs

### Install Docker

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update -y
sudo apt-get upgrade -y
sudo apt-get install -y docker-ce docker-ce-cli containerd.io


### Install Docker Compose
# https://certbot.eff.org/instructions?ws=nginx&os=ubuntu-20

curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose

### Install Certbot

sudo snap install core; sudo snap refresh core
sudo snap install --classic certbot
sudo ln -s /snap/bin/certbot /usr/bin/certbot

### Install PowerShell
#
# sudo apt-get install -y wget apt-transport-https software-properties-common
# wget -q https://packages.microsoft.com/config/ubuntu/20.04/packages-microsoft-prod.deb
# sudo dpkg -i packages-microsoft-prod.deb
# sudo apt-get update
# sudo apt-get install -y powershell
# sudo chsh /usr/bin/pwsh