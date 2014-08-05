#!/bin/bash
#
# requires:
#  bash
#
set -e
set -o pipefail

for i in ../centos-*/; do
  [[ -d ${i} ]] || continue
  echo ... ${i}
  diff Vagrantfile ${i}/Vagrantfile && continue

  rsync Vagrantfile ${i}/
done
