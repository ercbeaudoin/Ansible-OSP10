#!/bin/bash
echo "remove stack user"
userdel -r stack

echo "Destroy all VMs"
for i in $(virsh list --all |grep osp10- |awk ' { print $2 } ');do virsh destroy $i;virsh undefine $i;done

echo "Remove cloud images"
rm -f /var/lib/libvirt/images/undercloud-osp10.qcow2 /var/lib/libvirt/images/osp10-*

echo "Remove tmp file"
rm -f /tmp/osp10-*

echo "Remove the tmp key"
rm -fr /tmp/osp10-undercloud/
