// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Passcode",
    platforms: [.iOS(.v14)],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "Passcode",
            targets: ["Passcode"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
        .package(url: "https://github.com/pointfreeco/swift-snapshot-testing.git", exact: "1.9.0")
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "Passcode",
            dependencies: []),
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
