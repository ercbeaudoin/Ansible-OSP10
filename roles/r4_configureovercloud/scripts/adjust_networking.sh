#!/bin/bash
cat << EOF >> ~/my_templates/advanced-networking.yaml
parameter_defaults:
  # Internal API used for private OpenStack Traffic
  InternalApiNetCidr: 172.17.1.0/24
  InternalApiAllocationPools: [{'start': '172.17.1.10', 'end': '172.17.1.200'}]
  InternalApiNetworkVlanID: 101

  # Tenant Network Traffic - will be used for VXLAN over VLAN
  TenantNetCidr: 172.17.2.0/24
  TenantAllocationPools: [{'start': '172.17.2.10', 'end': '172.17.2.200'}]
  TenantNetworkVlanID: 201

  # Public Storage Access - e.g. Nova/Glance <--> Ceph
  StorageNetCidr: 172.17.3.0/24
  StorageAllocationPools: [{'start': '172.17.3.10', 'end': '172.17.3.200'}]
  StorageNetworkVlanID: 301

  # Private Storage Access - i.e. Ceph background cluster/replication
  StorageMgmtNetCidr: 172.17.4.0/24
  StorageMgmtAllocationPools: [{'start': '172.17.4.10', 'end': '172.17.4.200'}]
  StorageMgmtNetworkVlanID: 401

  # External Networking Access - Public API Access
  ExternalNetCidr: 192.168.122.0/24
  # Leave room for floating IPs in the External allocation pool (if required)
  ExternalAllocationPools: [{'start': '192.168.122.100', 'end': '192.168.122.129'}]
  # Set to the router gateway on the external network
  ExternalInterfaceDefaultRoute: 192.168.122.1

  # Add in configuration for the Control Plane
  ControlPlaneSubnetCidr: "24"
  ControlPlaneDefaultRoute: 172.16.0.1
  EC2MetadataIp: 172.16.0.1
  DnsServers: ['192.168.122.1', '8.8.8.8']

EOF
