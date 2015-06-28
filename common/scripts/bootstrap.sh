#!/bin/bash
#
# requires:
#  bash
#
set -e
set -o pipefail
set -x

function yum() {
  $(type -P dnf 2>&1 || type -P yum) --disablerepo=updates "${@}"
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
