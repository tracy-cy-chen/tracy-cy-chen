#!/usr/bin/env bash

set -euo pipefail

script_dir="$(cd "$(dirname "$0")" && pwd)"
source "${script_dir}/../lib/common.sh"

box="${1:-box1}"

run_ssh "${box}" '
  set -euo pipefail
  dpkg -s auditd >/dev/null
  systemctl is-enabled auditd >/dev/null
  systemctl is-active auditd >/dev/null
  auditctl -s
'

print_result "t012" "${box}" "PASS: auditd is installed and active"
