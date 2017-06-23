#*******************************#
# Project - Install OSP 10 using #
###Server details
host: Dell 7500 2 cpu with 96Gib memory

I divided the project in different roles to make it easier to troubleshoot.
See below the details.

Note: By defaul the server are configured with 8G memory
You can change the memory used by each type of server by modifying the following files:
under groupvars/
>>baremetal.yml  
>>osp10-baremetal.yml  
>>osp10-compute.yml  
>>osp10-control.yml

Note2: This project deploys one undercloud + OSP10 overcloud (3 Controllers, 2 compute) by default

## How it works
1) You will need to recreate the following secret file:
cat roles/r3_registercephnodes/vars/secret.yml
sub_user:
  name: <rhn-support-kerberos>
  pw: <Portal credentials>
  org_id: <Org id>
To create a new vault secret.yml file
ansible-vault create roles/r3_registercephnodes/vars/secret.yml

2) Run the playbook
ansible-playbook main.yml -v --ask-vault-pass
>Enter the password

## To destroy the lab:
# ./destroyOSP
This will deregister the VMs, destroy the VMs and the disk images.



## Configure the hyperversor network and create the undercloud/overcloud VMs
1_confighostandcreateVMs.yml 
# Roles
  r1_checkhostnetwork/ 
  r1_createVMs/        
## Connect to the undercloud and subscribe the server (vault is used - password required) 
2_registerundercloud.yml      
# Role
  r2_registerundercloud
## Deploy the undercloud
  r3_configundercloud.yml  
# Role
  r3_deploy_undercloud 
## Prepare for the overcloud deployment
4_configureOvercloud
# Role
  r4_configureovercloud
## Deploy the overcloud
5_deploy_overcloud  
# Role
  r5_deploy_overcloud
### Extra
## Script to destroy the projects
destroyOSP.sh  

