#!/bin/sh
#
# requires:
#  bash
#
set -e
set -o pipefail
set -x

function yum() {
  $(type -P yum) --disablerepo=updates "${@}"
}

# Add installation packages ...
addpkgs="
 ntp ntpdate
 man
 sudo rsync git make
 vim-minimal screen
 nmap lsof strace tcpdump traceroute telnet ltrace bind-utils sysstat nc
 wireshark
 zip
"

if [[ -n "$(echo ${addpkgs})" ]]; then
  yum install -y ${addpkgs}
fi

function config_sshd_config() {
  local sshd_config_path=$1 keyword=$2 value=$3
  [[ -a "${sshd_config_path}" ]] || { echo "[ERROR] file not found: ${sshd_config_path} (${BASH_SOURCE[0]##*/}:${LINENO})" >&2; return 1; }
  [[ -n "${keyword}" ]] || { echo "[ERROR] Invalid argument: keyword:${keyword} (${BASH_SOURCE[0]##*/}:${LINENO})" >&2; return 1; }
  [[ -n "${value}"   ]] || { echo "[ERROR] Invalid argument: value:${value} (${BASH_SOURCE[0]##*/}:${LINENO})" >&2; return 1; }

  egrep -q -w "^${keyword}" ${sshd_config_path} && {
    # enabled
    sed -i "s,^${keyword}.*,${keyword} ${value},"  ${sshd_config_path}
  } || {
    # commented parameter is "^#keyword value".
    # therefore this case should *not* be included white spaces between # and keyword.
    egrep -q -w "^#${keyword}" ${sshd_config_path} && {
      # disabled
      sed -i "s,^#${keyword}.*,${keyword} ${value}," ${sshd_config_path}
    } || {
      # no match
      echo "${keyword} ${value}" >> ${sshd_config_path}
    }
  }

  egrep -q -w "^${keyword} ${value}" ${sshd_config_path}
}

{
  while read param value; do
    config_sshd_config /etc/ssh/sshd_config ${param} ${value}
  done < <(cat <<-EOS | egrep -v '^#|^$'
	#
	# "Top 20 OpenSSH Server Best Security Practices"
	# * http://www.cyberciti.biz/tips/linux-unix-bsd-openssh-server-best-practices.html
	#

	# 02: Only Use SSH Protocol 2
	Protocol 2

	# 03: Limit Users SSH Access
	DenyUsers root

	# 04: Configure Idle Log Out Timeout Interval
	ClientAliveInterval 0
	ClientAliveCountMax 3

	# 05: Disable .rhosts Files
	IgnoreRhosts yes

	# 06: Disable Host-Based Authentication
	HostbasedAuthentication no

	# 07: Disable root Login via SSH
	PermitRootLogin no

	# 09: Change SSH Port and Limit IP Binding
	Port 22

        # 11: Use Public Key Based Authentication
        PasswordAuthentication no

	# 15: Disable Empty Passwords
	PermitEmptyPasswords no

	# Others
	StrictModes   yes
	X11Forwarding no
	UseDNS        no
	EOS
        )
}

{
  user_name=vagrant
  user_group=${user_name}
  user_home=/home/${user_name}

  getent group  ${user_group} >/dev/null || groupadd    ${user_group}
  getent passwd ${user_name}  >/dev/null || useradd  -g ${user_group} -d ${user_home} -s /bin/bash -m ${user_name}

  egrep -q ^umask ${user_home}/.bashrc || {
    echo umask 022 >> ${user_home}/.bashrc
  }

  user_ssh_dir=${user_home}/.ssh
  authorized_keys_path=${user_ssh_dir}/authorized_keys

  [[ -d "${user_ssh_dir}" ]] || mkdir -m 0700 ${user_ssh_dir}
  # make sure to directory attribute is 0700
  chmod 0700 ${user_ssh_dir}

  until curl -fsSkL https://raw.githubusercontent.com/mitchellh/vagrant/master/keys/vagrant.pub >> ${authorized_keys_path}; do
    sleep 1
  done

  echo         root:${user_name} | chpasswd
  echo ${user_name}:${user_name} | chpasswd

  chown -R ${user_group}:${user_name} ${user_ssh_dir}

  sed -i "s/^\(^Defaults\s*requiretty\).*/# \1/" /etc/sudoers
  egrep ^${user_name} -w /etc/sudoers || { echo "${user_name} ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers; }
}

{
  iso_path=/home/vagrant/VBoxGuestAdditions.iso
  mnt_path=/mnt

  mount -o loop ${iso_path} ${mnt_path}
  yum install --disablerepo=updates -y make kernel-devel gcc perl bzip2

  ${mnt_path}/VBoxLinuxAdditions.run --nox11 || :

  umount ${mnt_path}
  rm ${iso_path}
}
