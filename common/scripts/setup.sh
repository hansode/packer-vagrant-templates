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

cat <<-REPO > /etc/yum.repos.d/CentOS-Base.repo
	[base]
	name=CentOS-\$releasever - Base
	baseurl=http://ftp.riken.jp/Linux/centos/\$releasever/os/\$basearch/
	gpgcheck=1
	gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-${majorver}

	[updates]
	name=CentOS-\$releasever - Updates
	baseurl=http://ftp.riken.jp/Linux/centos/\$releasever/updates/\$basearch/
	gpgcheck=1
	gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-${majorver}
	REPO
