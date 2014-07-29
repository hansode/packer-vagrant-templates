#!/bin/bash
#
# requires:
#  bash
#
set -e
set -o pipefail
set -x

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

  echo         root:${user_name} | /usr/sbin/chpasswd
  echo ${user_name}:${user_name} | /usr/sbin/chpasswd

  chown -R ${user_group}:${user_name} ${user_ssh_dir}

  sed -i "s/^\(^Defaults\s*requiretty\).*/# \1/" /etc/sudoers
  egrep ^${user_name} -w /etc/sudoers || { echo "${user_name} ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers; }
}
