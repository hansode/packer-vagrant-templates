#!/bin/bash
#
# requires:
#  bash
#
set -e
set -o pipefail
set -x

mv /etc/yum.repos.d/CentOS-Base.repo /etc/yum.repos.d/CentOS-Base.repo.saved

releasever=$(< /etc/yum/vars/releasever)
majorver=${releasever%%.*}

baseurl=http://vault.centos.org
case "${releasever}" in
  # latest version
  5.11 | 6.6 | 7.1.1503 )
    baseurl=http://ftp.jaist.ac.jp/pub/Linux/CentOS
    ;;
esac

cat <<-REPO > /etc/yum.repos.d/CentOS-Base.repo
	[base]
	name=CentOS-\$releasever - Base
	baseurl=${baseurl}/\$releasever/os/\$basearch/
	gpgcheck=1
	gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-${majorver}

	[updates]
	name=CentOS-\$releasever - Updates
	baseurl=${baseurl}/\$releasever/updates/\$basearch/
	gpgcheck=1
	gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-${majorver}
	REPO
