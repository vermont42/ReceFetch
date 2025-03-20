// Copyright © 2025 Josh Adams. All rights reserved.

import Foundation
@testable import ReceFetch
import Testing

struct RecipesURLTests {
  @Test func testURL() {
    guard
      let expectedStandardURL = URL(string: "https://d3jbb8n5wk0qxi.cloudfront.net/recipes.json"),
      let expectedEmptyURL = URL(string: "https://d3jbb8n5wk0qxi.cloudfront.net/recipes-empty.json"),
      let expectedMalformedURL = URL(string: "https://d3jbb8n5wk0qxi.cloudfront.net/recipes-malformed.json"),
      let expectedWithMoreURL = URL(string: "https://raceconditionsoftware.s3.us-west-1.amazonaws.com/ReceFetch/recipes_with_more.json")
    else {
      Issue.record("Failed to initialize expected URL.")
      return
    }

    #expect(expectedStandardURL == RecipesURL.standard.url)
    #expect(expectedEmptyURL == RecipesURL.empty.url)
    #expect(expectedMalformedURL == RecipesURL.malformed.url)
    #expect(expectedWithMoreURL == RecipesURL.withMore.url)
  }

  @Test func testDisplayName() {
    let expectedStandardDisplayName = "Standard"
    let expectedEmptyDisplayName = "Empty"
    let expectedMalformedDisplayName = "Malformed"
    let expectedWithMoreDisplayName = "With More"

    #expect(expectedStandardDisplayName == RecipesURL.standard.displayName)
    #expect(expectedEmptyDisplayName == RecipesURL.empty.displayName)
    #expect(expectedMalformedDisplayName == RecipesURL.malformed.displayName)
    #expect(expectedWithMoreDisplayName == RecipesURL.withMore.displayName)
  }
}
