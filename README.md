# j2objc-xcframeworks

Building J2ObjC is described here: https://developers.google.com/j2objc/guides/building-j2objc

Maven is necessary to build the j2objc libraries.
```Shell
brew install maven
```

Make sure to pull the submodules:
```Shell
git submodule update --init --recursive
```

Build the J2ObjC frameworks:
```Shell
./build.sh
```

Copy the frameworks into Mobo/Libraries/iOS:
- JRE.xcframework
- JavaxInject.xcframework
