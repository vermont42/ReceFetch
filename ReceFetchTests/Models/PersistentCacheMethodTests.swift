// Copyright © 2025 Josh Adams. All rights reserved.

@testable import ReceFetch
import Testing

struct PersistentCacheMethodTests {
  @Test func testDisplayName() {
    let expectedNoneDisplayName = "None"
    let expectedFilesystemDisplayName = "Filesystem"
    #expect(expectedNoneDisplayName == PersistentCacheMethod.none.displayName)
    #expect(expectedFilesystemDisplayName == PersistentCacheMethod.filesystem.displayName)
  }
}
