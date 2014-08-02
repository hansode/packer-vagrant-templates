#!/bin/bash
#
# requires:
#  bash
#
set -e
set -o pipefail

for i in ../centos-*/; do
  [[ -d ${i} ]] || continue
  cp Vagrantfile ${i}/
done
