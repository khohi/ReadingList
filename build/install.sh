#! /bin/bash
set -e

bundle install
brew install mint
mint run yonaskolb/xcodegen
if pod check; then
	pod install
else
	pod install --repo-update
fi