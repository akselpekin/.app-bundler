#!/usr/bin/env bash

# codesign.sh
# Usage: ./codesign.sh <APP_PATH> <SIGNING_IDENTITY> [<ENTITLEMENTS_PATH>]
# Example: ./codesign.sh App.app "Developer ID: Example" App.entitlements

set -euo pipefail

if [ $# -lt 2 ]; then
  echo "Usage: $0 <APP_PATH> <SIGNING_IDENTITY> [<ENTITLEMENTS_PATH>]"
  exit 1
fi

APP_PATH="$1"
SIGN_IDENTITY="$2"
ENTITLEMENTS="${3:-}"

echo "Signing ${APP_PATH} with identity ${SIGN_IDENTITY}"
if [ -n "${ENTITLEMENTS}" ]; then
  echo "Using entitlements file ${ENTITLEMENTS}"
  codesign --deep --force --verbose --options runtime --sign "${SIGN_IDENTITY}" --entitlements "${ENTITLEMENTS}" "${APP_PATH}"
else
  codesign --deep --force --verbose --options runtime --sign "${SIGN_IDENTITY}" "${APP_PATH}"
fi

echo "Verification:"
codesign --verify --deep --strict --verbose=2 "${APP_PATH}"

echo "Code signing completed for ${APP_PATH}"