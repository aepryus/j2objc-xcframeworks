# j2objc-xcframeworks

Building J2ObjC is described here: https://developers.google.com/j2objc/guides/building-j2objc

Maven is necessary to build the j2objc libraries.
```shell
brew install maven
```

Make sure to pull the submodules:
```shell
git submodule update --init --recursive
```

Build the J2ObjC frameworks:
```shell
./build.sh
```
