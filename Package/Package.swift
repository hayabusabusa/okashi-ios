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
    dependencies: [
        .package(url: "https://github.com/kean/Nuke.git", .upToNextMajor(from: "11.6.4"))
    ],
    targets: [
        .target(name: "AppFeature",
                dependencies: [
                    "Service",
                    "Shared",
                    .product(name: "Nuke", package: "Nuke")
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
