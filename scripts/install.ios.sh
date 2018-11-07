#!/bin/bash -e

npm install -g react-native-cli >/dev/null 2>&1
npm install -g detox-cli >/dev/null 2>&1
gem install xcpretty >/dev/null 2>&1

export CODE_SIGNING_REQUIRED=NO
brew tap wix/brew
brew install applesimutils --HEAD

$HOME/.yarn/bin install

cd examples/Basic

$HOME/.yarn/bin install