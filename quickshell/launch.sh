#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "$0")" && pwd)"
export OMARCHY_PATH="$ROOT"
export PATH="$ROOT/bin:$PATH"
exec quickshell -p "$ROOT" "$@"
