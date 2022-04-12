#!/bin/sh

rm -rf ../MoboJava/Frameworks/libjre_emul.xcframework

mkdir ios-arm64
mkdir ios-arm64_x86_64-simulator
mkdir macos-arm64_x86_64

cp ~/j2objc/jre_emul/build_result/objs-iphone64/libjre_emul.a ios-arm64

lipo -create \
	~/j2objc/jre_emul/build_result/objs-simulator/libjre_emul.a \
	~/j2objc/jre_emul/build_result/objs-simulator64/libjre_emul.a \
	-output ios-arm64_x86_64-simulator/libjre_emul.a

lipo -create \
	~/j2objc/jre_emul/build_result/objs-macosx/libjre_emul.a \
	~/j2objc/jre_emul/build_result/objs-macosx64/libjre_emul.a \
	-output macos-arm64_x86_64/libjre_emul.a

xcodebuild -create-xcframework \
	-library ios-arm64/libjre_emul.a -headers ~/j2objc/dist/include/ \
	-library ios-arm64_x86_64-simulator/libjre_emul.a -headers ~/j2objc/dist/include/ \
	-library macos-arm64_x86_64/libjre_emul.a -headers ~/j2objc/dist/include/ \
	-output ../MoboJava/Frameworks/libjre_emul.xcframework

rm -rf ios-arm64
rm -rf ios-arm64_x86_64-simulator
rm -rf macos-arm64_x86_64
