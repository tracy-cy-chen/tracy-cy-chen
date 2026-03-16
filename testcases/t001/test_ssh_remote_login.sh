#!/usr/bin/env bash

set -euo pipefail

script_dir="$(cd "$(dirname "$0")" && pwd)"
# Shared helpers keep BOX selection and SSH access consistent across testcases.
source "${script_dir}/../lib/common.sh"

box="${1:-box1}"

run_ssh "${box}" '
  set -euo pipefail
  test "$(whoami)" = "vagrant"
  hostname
  id
'

print_result "t001" "${box}" "PASS: SSH remote login succeeded"
