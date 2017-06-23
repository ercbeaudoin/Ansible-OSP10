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

