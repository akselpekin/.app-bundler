#!/usr/bin/env bash

# create_keychain_profile.sh
# Usage: ./create_keychain_profile.sh <PROFILE_NAME> <APPLE_ID> <APP_SPECIFIC_PASSWORD> <TEAM_ID>
# Example: ./create_keychain_profile.sh myProfile example@example.com paswwwooorddd TTTEAAAAMMM

set -euo pipefail

if [ $# -ne 4 ]; then
  echo "Usage: $0 <PROFILE_NAME> <APPLE_ID> <APP_SPECIFIC_PASSWORD> <TEAM_ID>"
  exit 1
fi

PROFILE_NAME="$1"
APPLE_ID="$2"
APP_PW="$3"
TEAM_ID="$4"

echo "Creating keychain profile '${PROFILE_NAME}'..."
xcrun notarytool store-credentials \
  --apple-id "${APPLE_ID}" \
  --team-id "${TEAM_ID}" \
  --password "${APP_PW}" \
  --keychain-profile "${PROFILE_NAME}"

echo "Keychain profile '${PROFILE_NAME}' created successfully."
echo "Available profiles:"
xcrun notarytool store-credentials list
