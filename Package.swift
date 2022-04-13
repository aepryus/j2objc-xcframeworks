// swift-tools-version: 5.6

import PackageDescription

let package = Package(
    name: "JRE",
    products: [
        .library(name: "JRE", targets: ["libjre_emul", "libjavax_inject"]),
    ],
    dependencies: [],
    targets: [
		.binaryTarget(name: "libjre_emul", path: "libjre_emul.xcframework"),
		.binaryTarget(name: "libjavax_inject", path: "libjavax_inject.xcframework"),
    ]
)
