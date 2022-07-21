#!/bin/bash

source /vagrant/provision_base.sh
yum install -y unzip

yum install -y yum-utils
yum-config-manager --add-repo https://rpm.releases.hashicorp.com/RHEL/hashicorp.repo
yum -y install terraform
terraform version

yum install python3-pip -y
pip3 install awscli

curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
./aws/install

/usr/local/bin/aws --version

yum install epel-release -y
yum install jq -y

