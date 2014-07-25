#!/bin/bash
#
# requires:
#  bash
#
set -e
set -o pipefail
set -x

{
  iso_path=/home/vagrant/linux.iso
  mnt_path=/mnt

  mount -o loop ${iso_path} ${mnt_path}
  yum install --disablerepo=updates -y fuse-libs
  yum install --disablerepo=updates -y perl net-tools

  cd /tmp
  tar xzf /mnt/VMwareTools-*.tar.gz

  umount ${mnt_path}
  rm ${iso_path}

  /tmp/vmware-tools-distrib/vmware-install.pl -d
  rm -r /tmp/vmware-tools-distrib

  yum remove --disablerepo=updates -y perl net-tools
}
