// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Package",
    platforms: [.iOS(.v14)],
    products: [
        .library(
            name: "AppFeature",
            targets: ["AppFeature"]),
    ],
    dependencies: [],
    targets: [
        .target(name: "AppFeature",
                dependencies: [
                    "Service",
                    "Shared"
                ],
                path: "./Sources/Features/AppFeature"),
        .target(name: "Service",
                dependencies: [
                    "Shared"
                ]),
        .target(name: "Shared",
                dependencies: []),
    ]
)
