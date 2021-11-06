// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "TextSourceKit",
    products: [
        .library(
            name: "TextSourceKit",
            targets: ["TextSourceKit"]
        )
    ],
    dependencies: [],
    targets: [
        .target(
            name: "TextSourceKit",
            dependencies: []
        ),
        .testTarget(
            name: "TextSourceKitTests",
            dependencies: ["TextSourceKit"]
        )
    ]
)
