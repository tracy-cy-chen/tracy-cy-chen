#!/usr/bin/env bash

set -euo pipefail

script_dir="$(cd "$(dirname "$0")" && pwd)"
source "${script_dir}/../lib/common.sh"

box="${1:-box1}"

run_ssh "${box}" '
  set -euo pipefail
  command -v sestatus >/dev/null
  command -v getenforce >/dev/null
  dpkg -s selinux-basics selinux-policy-default policycoreutils >/dev/null
  test -f /etc/selinux/config
  sestatus
  getenforce
'

print_result "t011" "${box}" "PASS: SELinux packages and runtime commands are present"
