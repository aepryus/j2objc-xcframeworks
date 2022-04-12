#!/bin/sh

rm -rf ../MoboJava/Frameworks/libjavax_inject.xcframework

mkdir ios-arm64
mkdir ios-arm64_x86_64-simulator
mkdir macos-arm64_x86_64

cp ~/j2objc/inject/javax_inject/build_result/objs-iphone64/libjavax_inject.a ios-arm64

lipo -create \
	~/j2objc/inject/javax_inject/build_result/objs-simulator/libjavax_inject.a \
	~/j2objc/inject/javax_inject/build_result/objs-simulator64/libjavax_inject.a \
	-output ios-arm64_x86_64-simulator/libjavax_inject.a

lipo -create \
	~/j2objc/inject/javax_inject/build_result/objs-macosx/libjavax_inject.a \
	~/j2objc/inject/javax_inject/build_result/objs-macosx64/libjavax_inject.a \
	-output macos-arm64_x86_64/libjavax_inject.a

xcodebuild -create-xcframework \
	-library ios-arm64/libjavax_inject.a -headers ~/j2objc/inject/javax_inject/build_result/JavaxInject.h \
	-library ios-arm64_x86_64-simulator/libjavax_inject.a -headers ~/j2objc/inject/javax_inject/build_result/JavaxInject.h \
	-library macos-arm64_x86_64/libjavax_inject.a -headers ~/j2objc/inject/javax_inject/build_result/JavaxInject.h \
	-output ../MoboJava/Frameworks/libjavax_inject.xcframework

rm -rf ios-arm64
rm -rf ios-arm64_x86_64-simulator
rm -rf macos-arm64_x86_64
