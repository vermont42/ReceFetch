// Copyright © 2025 Josh Adams. All rights reserved.

import Foundation
import Observation

@Observable class SettingsViewModel {
  var isTempDirectoryEmpty = true

  func configure() {
    isTempDirectoryEmpty = FileManager.isTempDirectoryEmpty()
  }

  func clearTempDirectory() {
    FileManager.clearTempDirectory()
    isTempDirectoryEmpty = true
  }

  func getIsTempDirectoryEmpty() async -> Bool {
    isTempDirectoryEmpty
  }
}
