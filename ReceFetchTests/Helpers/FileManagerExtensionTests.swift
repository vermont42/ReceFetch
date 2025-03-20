// Copyright © 2025 Josh Adams. All rights reserved.

@testable import ReceFetch
import Testing
import UIKit

struct FileManagerExtensionTests {
  @Test func testClearTempDirectoryAndIsTempDirectoryEmpty() async {
    FileManager.clearTempDirectory()
    #expect(FileManager.isTempDirectoryEmpty())
    await FileManagerExtensionTests.persistCloudImage()
    #expect(!FileManager.isTempDirectoryEmpty())
  }

  static func persistCloudImage() async {
    let image = UIImage(systemName: "cloud.drizzle") ?? UIImage()
    let urlString = "https://raceconditionsoftware.s3.us-west-1.amazonaws.com/ReceFetch/img/BananaSlugLarge.jpg"
    guard let url = URL(string: urlString) else {
      Issue.record("Could not initialize URL for \(urlString).")
      return
    }
    Current.settings.persistentCacheMethod = .filesystem
    await ImageLoader().persistImage(image, for: url)
  }
}
