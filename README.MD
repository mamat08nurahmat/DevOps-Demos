# Welcome To DevOps Repo jenkins tutorial
This repository holds all of my experiments in the area of DevOps.

Deploy Jenkins to an Azure VM
https://docs.microsoft.com/en-us/azure/aks/jenkins-continuous-deployment

#!!!Warning
This sample script is for demo purposes to quickly provision a Jenkins environment that runs on an Azure VM. It uses the Azure custom script extension to configure a VM and then display the required credentials. Your ~/.kube/config is copied to the Jenkins VM.

curl https://raw.githubusercontent.com/mamat08nurahmat/azure-voting-app-redis/master/jenkins-tutorial/deploy-jenkins-vm.sh > azure-jenkins.sh
sh azure-jenkins.sh

#It takes a few minutes to create the VM and deploy the required components for Docker and Jenkins.
