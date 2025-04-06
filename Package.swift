// swift-tools-version: 6.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Z",
    platforms: [
        .macOS(.v15),
        .visionOS(.v2),
        .iOS(.v15),
    ],
    products: [
        .library(name: "Z",
                 type: .dynamic,
                 targets: ["Z"]
        ),
    ],
    targets: [
        .target(
            name: "Z",
            exclude: [
                "contrib",
                "examples",
                "test",
            ],
            publicHeadersPath: "include",
            cSettings: [
                .headerSearchPath("include"),
            ],
        ),
    ],
    //cLanguageStandard: .gnu11,
    //cxxLanguageStandard: .gnucxx17
)
