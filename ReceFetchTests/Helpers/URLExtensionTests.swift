// Copyright © 2025 Josh Adams. All rights reserved.

import Foundation
@testable import ReceFetch
import Testing

struct URLExtensionTests {
  @Test func testCouldNotInit() {
    let 🐶 = "🐶"
    #expect("Could not initialize URL from \(🐶)." == URL.couldNotInit(urlString: 🐶))
  }
}
