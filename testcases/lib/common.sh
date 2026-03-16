#!/usr/bin/env bash

set -euo pipefail

repo_root() {
  local script_dir
  script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
  cd "${script_dir}/../.." && pwd
}

box_ip() {
  case "${1:-}" in
    box1|vm1|vm1_ub2204_server)
      printf '%s\n' "192.168.56.11"
      ;;
    box2|vm2|vm2_ub2204_desktop)
      printf '%s\n' "192.168.56.12"
      ;;
    *)
      printf 'Unsupported box: %s\n' "${1:-}" >&2
      return 1
      ;;
  esac
}

box_name() {
  case "${1:-}" in
    box1|vm1|vm1_ub2204_server)
      printf '%s\n' "BOX1"
      ;;
    box2|vm2|vm2_ub2204_desktop)
      printf '%s\n' "BOX2"
      ;;
    *)
      printf 'Unsupported box: %s\n' "${1:-}" >&2
      return 1
      ;;
  esac
}

ssh_key_path() {
  local root
  root="$(repo_root)"
  if [[ -f "${root}/vagrant_boxes/vagrant_keys/id_ed25519_vbox" ]]; then
    printf '%s\n' "${root}/vagrant_boxes/vagrant_keys/id_ed25519_vbox"
    return 0
  fi
  if [[ -f "${root}/vagrant_boxes/vagrant_keys/id_ed25519" ]]; then
    printf '%s\n' "${root}/vagrant_boxes/vagrant_keys/id_ed25519"
    return 0
  fi
  printf 'No supported private key found in vagrant_boxes/vagrant_keys.\n' >&2
  return 1
}

ssh_opts() {
  local key
  key="$(ssh_key_path)"
  printf '%s\n' \
    "-i" "${key}" \
    "-o" "BatchMode=yes" \
    "-o" "StrictHostKeyChecking=no" \
    "-o" "UserKnownHostsFile=/dev/null" \
    "-o" "ConnectTimeout=5"
}

run_ssh() {
  local box="$1"
  shift
  local ip
  ip="$(box_ip "${box}")"
  local -a opts
  mapfile -t opts < <(ssh_opts)
  ssh "${opts[@]}" "vagrant@${ip}" "$@"
}

print_result() {
  local testcase="$1"
  local box="$2"
  local status="$3"
  printf '[%s] %s %s\n' "${testcase}" "$(box_name "${box}")" "${status}"
}
