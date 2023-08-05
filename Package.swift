
// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "example-package",
    targets: [
        .executableTarget(name: "312a"),
        .executableTarget(name: "312b"),
        .executableTarget(name: "312c"),
        .executableTarget(name: "lc25"),
        .executableTarget(name: "lc30"),
        .testTarget(name: "lc25Test", dependencies: ["lc25"]),
        .testTarget(name: "lc30Test", dependencies: ["lc30"]),
    ]
)
