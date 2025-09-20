#!/usr/bin/env bash
set -euo pipefail

project_file="${1:-default.project.json}"
task_file="${2:?Path to test task file is required}"

tmpfile="$(mktemp --suffix=.rbxl dist.XXXXXX 2>/dev/null || mktemp -t dist.XXXXXX.rbxl)"
trap 'rm -f "$tmpfile"' EXIT

rojo build "$project_file" --output "$tmpfile"
python3 scripts/python/upload_and_run_task.py "$tmpfile" "$task_file"