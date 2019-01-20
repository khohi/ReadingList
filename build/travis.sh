#! /bin/bash
set -e

pod install

xcodebuild \
	-workspace ReadingList.xcworkspace \
	-scheme ReadingList \
	-destination "${TEST_SDK}" \
	clean test | xcpretty


# Deploy on master, if we have access to the necessary secure variables
if [ "${TRAVIS_SECURE_ENV_VARS}" == "true" ] && [ "${TRAVIS_BRANCH}" == "master" ]; then
  bundle exec fastlane deploy
fi