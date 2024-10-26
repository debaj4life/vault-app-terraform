Repository: - git@gitlab.com:lamtech-tooling/terraform/jenkins-ec2-app.git
Description: - Provisioning AWS EC2 instance to deploy vault.
Prerequisites:

Terraform version: ~>1.3.3

Provider:

Source = hashicorp/aws
Version = ~>4.0
Backend = S3 bucket

Installation:

Install Terraform.
Configure S3 bucket
Terraform configuration files.
Vault CLI

Usage:

Run terraform init to initialize the project.
Run terraform plan to plan the resources.
Run terraform apply to create the resources.

Variables:


region: AWS region (required)

instance_type: EC2 instance type (default: t3.medium)

Outputs:


domain name: Web address of the created EC2 instance for vault.

Accessing Vault:
Run the following commands to access vault.


ssh into your server to configureg Vault - ssh -i "tutorial-key.pem" ec2-user@ec2-xx-xx-xxx-xx.eu-west-2.compute.amazonaws.com. Remember to amend EC2 IP address.


export VAULT_ADDR="https://vault.techrite.org"


echo $VAULT_ADDR


To obtain the keys run either of the following keys.
a. vault operator init - for Mac/Linux users
b. sudo snap install vault - Windows users


Enter https://vault.lamtech.io into the browser.


You will be asked to enter the first 3 keys and then enter the root token.
Unseal Key 1: xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
Unseal Key 2: xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
Unseal Key 3: xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
Unseal Key 4: xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
Unseal Key 5: xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
Initial Root Token: xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
