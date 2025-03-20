// Copyright © 2025 Josh Adams. All rights reserved.

import Foundation
@testable import ReceFetch
import Testing

class URLSessionExtensionTests {
  init() {
    URLSession.didProcessURLs = false
  }

  deinit {
    URLSession.didProcessURLs = false
  }

  @Test func testStub() {
    Current.settings.recipesURL = .withMore
    let session = URLSession.stub
    #expect(session.configuration.protocolClasses?[0] is URLProtocolStub.Type)
    let expectedTestURLCount = MockData.images.count + RecipesURL.allCases.count
    #expect(expectedTestURLCount == URLSession.urlDataDict.count)
  }

  @Test func testSharedNoCache() {
    let config = URLSession.sharedNoCache.configuration
    #expect(config.requestCachePolicy == .reloadIgnoringLocalCacheData)
    #expect(config.urlCache == nil)
  }
}
