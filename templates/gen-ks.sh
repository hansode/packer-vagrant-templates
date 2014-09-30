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

  echo ... ${ks_path}
  ks_tmp=$(render_ks_cfg releasever=${releasever} basearch=${basearch})

  diff ${ks_path} <(echo "${ks_tmp}") && return 0

  echo "${ks_tmp}" > ${ks_path}
}

function render_ks_cfg() {
  eval "${@}"

  sed "s,__releasever__,${releasever},; s,__basearch__,${basearch},;" ks.${releasever%%.*}.cfg
}

for releasever in 7.0.1406 6.{0..5} 5.{2..11}; do
  for basearch in x86_64 i386; do
    gen_ks_cfg releasever=${releasever} basearch=${basearch}
  done
done
