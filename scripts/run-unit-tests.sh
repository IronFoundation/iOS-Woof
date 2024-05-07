#!/usr/bin/env bash

readonly TEST_SCHEME="WoofTests"
readonly DESTINATION_PLATFORM="iOS Simulator"
readonly DESTINATION_NAME="iPhone 15 Pro"

cd Woof
xcodebuild \
  -scheme "${TEST_SCHEME}" \
  -sdk iphoneos \
  -destination "platform=${DESTINATION_PLATFORM},name=${DESTINATION_NAME}" \
  -quiet \
  test
