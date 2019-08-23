#!/bin/bash

###install java
#java -version
sudo apt install default-jre
#javac -version
sudo apt install default-jdk
  
sudo bash -c 'cat << EOF >> /etc/environment
JAVA_HOME="/usr/lib/jvm/java-11-openjdk-amd64/bin/"
EOF'  
   
source /etc/environment
#echo $JAVA_HOME  

#install jenkins
  

#First, add the repository key to the system:
wget -q -O - https://pkg.jenkins.io/debian/jenkins.io.key | sudo apt-key add -

#append the Debian package repository address to the server's sources.list  
sudo sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'  

sudo apt-get update

sudo apt-get install jenkins -y


# Docker
sudo apt-get install apt-transport-https ca-certificates curl software-properties-common -y
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt-get update
sudo apt-get install docker-ce -y

# Azure CLI
echo "deb [arch=amd64] https://packages.microsoft.com/repos/azure-cli/ wheezy main" | sudo tee /etc/apt/sources.list.d/azure-cli.list
sudo apt-key adv --keyserver packages.microsoft.com --recv-keys 417A0893
sudo apt-get install apt-transport-https
sudo apt-get update && sudo apt-get install azure-cli

# Kubectl
cd /tmp/
sudo curl -kLO https://storage.googleapis.com/kubernetes-release/release/v1.8.0/bin/linux/amd64/kubectl
chmod +x ./kubectl
sudo mv ./kubectl /usr/local/bin/kubectl

# Configure access
usermod -aG docker jenkins
usermod -aG docker azureuser
sudo touch /var/lib/jenkins/jenkins.install.InstallUtil.lastExecVersion
service jenkins restart
