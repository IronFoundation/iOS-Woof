#!/usr/bin/env bash

readonly APP_NAME="Woof"
readonly IOS_SDK="17.0"

xcodebuild -project ${APP_NAME}/${APP_NAME}.xcodeproj \
           -scheme ${APP_NAME} \
           -sdk iphonesimulator${IOS_SDK} \
           -quiet
