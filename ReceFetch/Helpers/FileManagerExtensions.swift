// Copyright © 2025 Josh Adams. All rights reserved.

import Foundation

extension FileManager {
  static func clearTempDirectory() {
    do {
      let fileManager = FileManager.default
      let tempDirURL = fileManager.temporaryDirectory
      let tempDirectory = try fileManager.contentsOfDirectory(atPath: tempDirURL.path)
      try tempDirectory.forEach { file in
        let fileURL = tempDirURL.appendingPathComponent(file)
        try fileManager.removeItem(atPath: fileURL.path)
      }
    } catch {}
  }

  static func isTempDirectoryEmpty() -> Bool {
    do {
      let fileManager = FileManager.default
      let tempDirURL = fileManager.temporaryDirectory
      let tempDirectory = try fileManager.contentsOfDirectory(atPath: tempDirURL.path)
      return tempDirectory.isEmpty
    } catch {
      return true
    }
  }
}
