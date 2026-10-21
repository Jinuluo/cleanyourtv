#!/usr/bin/env bash
# Build and check the A90J fork locally. Does not connect to a TV.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
# Keep this fork's signing identity local and portable, outside Git.
export ANDROID_USER_HOME="${ANDROID_USER_HOME:-$ROOT/.local/android}"
cd "$ROOT/launcher"
./gradlew --no-daemon --console=plain testReleaseUnitTest lintRelease assembleRelease
mkdir -p "$ROOT/dist"
cp app/build/outputs/apk/release/app-release.apk "$ROOT/dist/cleanyourtv-a90j.apk"
cd "$ROOT/dist"
if command -v shasum >/dev/null 2>&1; then
    shasum -a 256 cleanyourtv-a90j.apk > SHA256SUMS
else
    sha256sum cleanyourtv-a90j.apk > SHA256SUMS
fi
