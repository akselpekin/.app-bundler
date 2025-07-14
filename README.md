# app-helpers

## Usages
Before running the scripts ensure they're executable: `chmod +x example.sh` *(This will make the scripts executable)*

### app_bundler.sh
Usage: `./app_bundler.sh <APP_NAME> <BUNDLE_ID> <VERSION> <EXECUTABLE_PATH> <ICON_PATH>`

### codesign.sh
Usage: `./codesign.sh <APP_PATH> <SIGNING_IDENTITY> [ENTITLEMENTS_PATH]`

### create_keychain_profile.sh
Usage: `./create_keychain_profile.sh <PROFILE_NAME> <APPLE_ID> <APP_SPECIFIC_PASSWORD> <TEAM_ID>`

### notaryservice.sh
Usage: `./notaryservice.sh <APP_PATH>`
*Follows interactive prompts for manual or keychain-profile mode.*
