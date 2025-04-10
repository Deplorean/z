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
        .library(name: "z",
                 targets: ["z"]
        )
    ],
    targets: [
        .testTarget(
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
            publicHeadersPath: "include",
            cSettings: [
                .define("HAVE_HIDDEN"),
                .define("MAX_WBITS", to: "14"),
                .define("MAX_MEM_LEVEL", to: "7"),
                .define("HAVE_UNISTD_H"),
                .define("_LARGEFILE64_SOURCE"),
                .define("ZLIB_DEBUG", to: "", .when(configuration: .debug)),
                .unsafeFlags([
                    "-O3",
                    "-m64"
                ])
            ]
        )
    ],
    swiftLanguageModes: [
        .v6
    ]
)
