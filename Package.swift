// swift-tools-version: 6.0.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "libz",
    platforms: [
        .macOS(.v15),
        .visionOS(.v2),
        .iOS(.v15)
    ],
    products: [
        .executable(name: "untgz",
                    targets: ["untgz"]),
        .executable(name: "z_tests",
                    targets: ["z_tests", "z"]),
        .library(name: "z",
                 targets: ["z"]
        )
    ],
    targets: [
        .executableTarget(
            name: "z_tests",
            dependencies: [
                .target(name: "z")
            ]
        ),
        .executableTarget(
            name: "untgz",
            dependencies: [
                .target(name: "z")
            ],
            path: "Sources/z/contrib/untgz",
            sources: [
                "untgz.c"
            ]
        ),
        .target(
            name: "z",
            sources: [
                // sources *.c
                "adler32.c",
                "compress.c",
                "crc32.c",
                "deflate.c",
                "gzclose.c",
                "gzlib.c",
                "gzread.c",
                "gzwrite.c",
                "infback.c",
                "inffast.c",
                "inflate.c",
                "inftrees.c",
                "trees.c",
                "uncompr.c",
                "zutil.c"
            ],
            cSettings: [
                .define("HAVE_UNISTD_H"),
                .define("_LARGEFILE64_SOURCE"),
                .define("HAVE_HIDDEN"),
                .headerSearchPath("include")
            ]
        )
    ]
)
