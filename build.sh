#!/bin/sh

#	iphone64:       iOS arm64,
#	simulator:      Simulator x86_64,
#	simulator64:    Simulator arm64
#	macosx:         macOS x86_64 	
#	macosx64:       macOS arm64
 
cp Resources/common.mk ../j2objc/make
cp Resrouces/j2objcc.sh ../j2objc/scripts
export J2OBJC_ARCHS="iphone64 simulator simulator64 macosx macosx64"
cd ../j2objc
make -j8 frameworks
