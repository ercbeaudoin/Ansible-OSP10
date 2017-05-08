#!/bin/bash
echo "remove stack user"
userdel -r stack

#virsh destroy undercloud-osp8

#virsh undefine undercloud-osp8
echo "Destroy all VMs"
for i in $(virsh list --all |grep osp8- |awk ' { print $2 } ');do virsh destroy $i;virsh undefine $i;done

echo "Remove cloud images"
rm -f /var/lib/libvirt/images/undercloud-osp8.qcow2 /var/lib/libvirt/images/osp8-*

echo "Remove tmp file"
rm -f /tmp/osp8-*

echo "Remove the tmp key"
rm -fr /tmp/osp8-undercloud/
