#!/usr/bin/env bash

readonly APP_NAME="Woof"
readonly IOS_SDK="17.2"

source ~/.bash_profile
cd ${APP_NAME}
set -o pipefail && xcodebuild \
-scheme ${APP_NAME} \
-sdk iphonesimulator${IOS_SDK} \
| xcpretty
