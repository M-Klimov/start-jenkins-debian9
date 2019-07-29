#!/bin/bash

sudo apt update -y && 
sudo apt upgrade -y &&
sudo apt install -y apt-transport-https ca-certificates curl software-properties-common gnupg2 &&
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add - &&
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable" &&
sudo apt update -y &&
sudo apt install docker-ce -y &&

sudo curl -L "https://github.com/docker/compose/releases/download/1.24.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose &&
sudo chmod +x /usr/local/bin/docker-compose &&

sudo apt install default-jre -y &&

sudo service apache2 stop &&
sudo apt-get purge apache2 apache2-utils -y &&
sudo apt-get autoremove &&

sudo rm -rf /etc/apache2 &&
sudo rm -rf /usr/sbin/apache2 &&
sudo rm -rf /usr/lib/apache2 &&
sudo rm -rf /usr/share/apache2 &&
sudo rm -rf /usr/share/man/man8/apache2.8.gz &&

whereis apache2 &&
java -version &&
docker-compose --version &&

sudo chmod 777 /var/jenkins_home &&
sudo /var/jenkins_home/tools/start &&

sudo docker exec jenkins ssh-keygen -t rsa -f /var/jenkins_home/.ssh/id_rsa -q -P "" &&

sleep 15 &&

echo "public key" &&
cat /var/jenkins_home/.ssh/id_rsa.pub &&
echo "private key" &&
cat /var/jenkins_home/.ssh/id_rsa &&
echo "initialAdminPassword" &&
cat /var/jenkins_home/secrets/initialAdminPassword &&

sudo mkdir -p /var/www &&
sudo chmod 777 /var/www
