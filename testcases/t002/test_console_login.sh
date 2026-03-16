#!/usr/bin/env bash

set -euo pipefail

script_dir="$(cd "$(dirname "$0")" && pwd)"
source "${script_dir}/../lib/common.sh"

box="${1:-box1}"

run_ssh "${box}" '
  set -euo pipefail
  getent passwd vagrant >/dev/null
  systemctl is-enabled getty@tty1.service >/dev/null
  systemctl is-active getty@tty1.service >/dev/null
'

print_result "t002" "${box}" "PASS: Console login service is ready on tty1"
