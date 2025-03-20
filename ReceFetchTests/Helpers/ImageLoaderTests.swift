// Copyright © 2025 Josh Adams. All rights reserved.

@testable import ReceFetch
import Testing
import UIKit

struct ImageLoaderTests {
  @Test func testLoadImage() async throws {
    guard let goodURL = URL(string: MockData.adamsURLPrefix + MockData.images[0]) else {
      Issue.record("Unable to initialize good photo URL.")
      return
    }

    let imageLoader = ImageLoader()
    let expectedErrorImage = UIImage(resource: .error)
    guard let badURL = URL(string: "https://racecondition.software") else {
      Issue.record("Unable to initialize bad photo URL.")
      return
    }

    Current.settings.persistentCacheMethod = .none
    await imageLoader.clearCache()
    var goodImage = await imageLoader.loadImage(url: goodURL)
    #expect(goodImage != nil)
    goodImage = await imageLoader.loadImage(url: goodURL)
    #expect(goodImage != nil)
    var errorImage = await imageLoader.loadImage(url: badURL)
    #expect(errorImage != nil)
    #expect(errorImage.pngData() == expectedErrorImage.pngData())

    Current.settings.persistentCacheMethod = .filesystem
    await imageLoader.clearCache()
    FileManager.clearTempDirectory()
    goodImage = await imageLoader.loadImage(url: goodURL)
    #expect(goodImage != nil)
    goodImage = await imageLoader.loadImage(url: goodURL)
    #expect(goodImage != nil)
    errorImage = await imageLoader.loadImage(url: badURL)
    #expect(errorImage != nil)
    #expect(errorImage.pngData() == expectedErrorImage.pngData())
  }
}
