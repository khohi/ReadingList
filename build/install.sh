#! /bin/bash
set -e

bundle install
brew install mint
mint run yonaskolb/xcodegen

if ! pod install; then
	pod install --repo-update
fi