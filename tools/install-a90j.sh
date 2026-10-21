#!/usr/bin/env bash
# Same upstream installer, preserving every existing launcher and system component.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
: "${TV_HOST:?set TV_HOST to the TV IP address}"
export ANDROID_USER_HOME="${ANDROID_USER_HOME:-$ROOT/.local/android}"
export STOCK_LAUNCHER=none
exec "$ROOT/launcher/build-and-install.sh"
