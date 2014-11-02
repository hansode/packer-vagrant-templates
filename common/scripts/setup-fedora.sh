#!/bin/bash
#
# requires:
#  bash
#
set -e
set -o pipefail
set -x

releasever=$(< /etc/yum/vars/releasever)
majorver=${releasever%%.*}
