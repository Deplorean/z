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
                 type: .dynamic,
                 targets: ["z"]
        )
    ],
    targets: [
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
            exclude: [
                "amiga",
                "doc",
                "contrib",
                "examples",
                "msdos",
                "nintendods",
                "old",
                "os400",
                "qnx",
                "test",
                "watcom",
                "win32"
            ],
            sources: [
                // zlib
                // headers *.h
                "crc32.h",
                "deflate.h",
                "gzguts.h",
                "inffast.h",
                "inffixed.h",
                "inflate.h",
                "inftrees.h",
                "trees.h",
                "zconf.h",
                "zlib.h",
                "zutil.h",

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
                "zutil.c",

                // contrib
                // iostream3
                "contrib/iostream3/zfstream.h"
                // "Sources/Z",
            ],
            cSettings: [
                .define("HAVE_UNISTD_H"),
                .headerSearchPath("include")
            ]
        )
    ]
)
