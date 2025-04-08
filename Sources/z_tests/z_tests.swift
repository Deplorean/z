//
//  z_tests.swift
//  libz
//
//  Created by Charles Gardner on 4/8/25.
//

import zlib

@main
struct z_tests {
    static func main() {
        let version = String(cString: zlibVersion())

        print ("zlib v\(version)")
    }
}
