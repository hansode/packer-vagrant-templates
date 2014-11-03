#!/bin/bash
#
# requires:
#  bash
#
set -e
set -o pipefail
set -x

{
  yum install --disablerepo=updates -y make kernel-devel gcc perl bzip2
}

if [[ -n "$(rpm -E %fedora)" ]]; then
  yum localinstall --nogpgcheck http://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
  yum install --disablerepo=updates --disablerepo=rpmfusion-free-updates -y VirtualBox-guest
else
  iso_path=/home/vagrant/VBoxGuestAdditions.iso
  mnt_path=/mnt

  mount -o loop ${iso_path} ${mnt_path}

  ${mnt_path}/VBoxLinuxAdditions.run --nox11 || :

  umount ${mnt_path}
  rm ${iso_path}
fi
