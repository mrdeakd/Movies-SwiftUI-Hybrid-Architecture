#!/bin/bash

rm -rf tmp_simulator_build
mkdir tmp_simulator_build && \
xcodebuild archive \
  -workspace Movies.xcworkspace \
  -scheme Movies \
  -archivePath ./tmp_simulator_build/builds/movies \
  -sdk iphonesimulator && \
cd tmp_simulator_build/builds/movies.xcarchive/Products/Applications && \
zip -r Movies_simulator_build.zip ./* && \
cd - && \
cp ./tmp_simulator_build/builds/movies.xcarchive/Products/Applications/Movies_simulator_build.zip ./ && \
rm -rf tmp_simulator_build

exit 0
