################################################## 
#install java
https://www.digitalocean.com/community/tutorials/how-to-install-java-with-apt-on-ubuntu-18-04#installing-specific-versions-of-openjdk
#java -version
sudo apt install default-jre
#javac -version
sudo apt install default-jdk
  
sudo bash -c 'cat << EOF >> /etc/environment
JAVA_HOME="/usr/lib/jvm/java-11-openjdk-amd64/bin/"
EOF'  
  
  
source /etc/environment
echo $JAVA_HOME  
################################################## 
#install jenkins
  https://www.digitalocean.com/community/tutorials/how-to-install-jenkins-on-ubuntu-18-04
  
#Step 1 — Installing Jenkins  

#First, add the repository key to the system:
wget -q -O - https://pkg.jenkins.io/debian/jenkins.io.key | sudo apt-key add -

#append the Debian package repository address to the server's sources.list  
sudo sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'  

sudo apt update

sudo apt install jenkins


#Step 2 — Starting Jenkins
sudo systemctl start jenkins
sudo systemctl status jenkins

#Step 3 — Opening the Firewall
sudo ufw allow 8080

sudo ufw status

# Note: If the firewall is inactive, the following commands will allow OpenSSH and enable the firewall:
sudo ufw allow OpenSSH
sudo ufw enable

Step 4 — Setting Up Jenkins

sudo cat /var/lib/jenkins/secrets/initialAdminPassword
