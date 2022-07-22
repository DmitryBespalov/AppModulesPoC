// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Passcode",
    platforms: [.iOS(.v14)],
    products: [
        .library(
            name: "Passcode",
            targets: ["Passcode"]),
    ],
    dependencies: [
        // dependency for the UI snapshot tests
        .package(url: "https://github.com/pointfreeco/swift-snapshot-testing.git", exact: "1.9.0"),
        // dependency to illustrate using common UI objects
        .package(path: "../CommonUI")
    ],
    targets: [
        .target(
            name: "Passcode",
            dependencies: ["CommonUI"]),
        .testTarget(
            name: "PasscodeTests",
            dependencies: [
                "Passcode",
                .product(name: "SnapshotTesting", package: "swift-snapshot-testing")
            ],
        exclude: ["__Snapshots__"]),
    ]
)

// https://developer.apple.com/documentation/xcode/bundling-resources-with-a-swift-package
