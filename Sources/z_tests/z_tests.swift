//
//  z_tests.swift
//  libz
//
//  Created by Charles Gardner on 4/8/25.
//

import Testing

@testable import z
@testable import z.zconf

struct z_tests {
    @Test("Assert module loads.")
    func assertModuleLoads() async throws {
        let version = String(cString: zlibVersion())

        assert(version == "1.3.1")
    }

    @Test("Assert Maximum value for memLevel in deflateInit2")
    func assertMaxMemoryLevel() async throws {
        let maxMemoryLevel = MAX_MEM_LEVEL

        assert(maxMemoryLevel == 9)
    }
}
