// Copyright © 2025 Josh Adams. All rights reserved.

import SwiftUI

@main struct AppLauncher {
  static func main() throws {
    if NSClassFromString("XCTestCase") == nil {
      ReceFetchApp.main()
    } else {
      ReceFetchTestApp.main()
    }
  }
}
