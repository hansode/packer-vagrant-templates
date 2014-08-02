#!/bin/bash
#
# requires:
#  bash
#
set -e
set -o pipefail
#set -x

function gen_ks_cfg() {
  eval "${@}"
  local target_dir=../centos-${releasever}-${basearch}
  local ks_path=${target_dir}/ks.cfg
  [[ -d ${target_dir} ]] || return 0

  echo ${ks_path}
  sed "s,__releasever__,${releasever},; s,__basearch__,${basearch},;" ks.${releasever%%.*}.cfg > ${ks_path}
}

for releasever in 7.0.1406 6.{0..5} 5.{2..10}; do
  for basearch in x86_64 i386; do
    gen_ks_cfg releasever=${releasever} basearch=${basearch}
  done
done
