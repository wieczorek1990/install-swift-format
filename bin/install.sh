#!/bin/sh
# Installer.

version=604.0.0

rm -rf swift-format/
git clone --depth=1 git@github.com:swiftlang/swift-format.git
cd swift-format/

git fetch origin tags/$version
git tag $version FETCH_HEAD
git checkout $version

swift build -c release

out=~/.local/bin/swift-format
rm -rf $out
cp .build/out/Products/Release/swift-format $out

cd ..
rm -rf swift-format/

