#!/bin/bash
cat << EOF >> ~/my_templates/advanced-networking.yaml
  # NIC Configs for our roles
  OS::TripleO::Compute::Net::SoftwareConfig: /home/stack/my_templates/nic-configs/compute.yaml
  OS::TripleO::Controller::Net::SoftwareConfig: /home/stack/my_templates/nic-configs/controller.yaml
  OS::TripleO::CephStorage::Net::SoftwareConfig: /home/stack/my_templates/nic-configs/ceph-storage.yaml
EOF
