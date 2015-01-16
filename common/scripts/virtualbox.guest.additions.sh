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
  iso_path=/home/vagrant/VBoxGuestAdditions.iso
  mnt_path=/mnt
}

rpm -E %fedora

case "$(rpm -E %fedora)" in
  %fedora) # centos
    mount -o loop ${iso_path} ${mnt_path}
    ${mnt_path}/VBoxLinuxAdditions.run --nox11 || :
    umount ${mnt_path}
    ;;
  [0-9]*) # maybe fedora
    yum localinstall --nogpgcheck -y http://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
    yum install --disablerepo=updates --disablerepo=rpmfusion-free-updates -y VirtualBox-guest
    yum remove -y rpmfusion-free-release-$(rpm -E %fedora)
    ;;
esac

{
  rm ${iso_path}
}
