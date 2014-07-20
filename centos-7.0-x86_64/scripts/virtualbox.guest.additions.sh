#!/bin/bash
#
# requires:
#  bash
#
set -e
set -o pipefail
set -x

{
  iso_path=/home/vagrant/VBoxGuestAdditions.iso
  mnt_path=/mnt

  mount -o loop ${iso_path} ${mnt_path}
  yum install --disablerepo=updates -y make kernel-devel gcc perl bzip2

  ${mnt_path}/VBoxLinuxAdditions.run --nox11 || :

  umount ${mnt_path}
  rm ${iso_path}
}
