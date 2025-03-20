// Copyright © 2025 Josh Adams. All rights reserved.

import Foundation
@testable import ReceFetch
import Testing

struct SortOrderTests {
  @Test func testCompareTo() {
    let urlString = "https://racecondition.software"
    let recipe1 = Recipe(uuid: "1", name: "Marmite", cuisine: "English", photoURLLargeString: urlString, photoURLSmallString: urlString, sourceURLString: nil, youtubeURLString: nil)
    let recipe2 = Recipe(uuid: "2", name: "Vegemite", cuisine: "Australian", photoURLLargeString: urlString, photoURLSmallString: urlString, sourceURLString: nil, youtubeURLString: nil)
    var sortOrder = SortOrder.name
    #expect(sortOrder.compare(recipe1: recipe1, recipe2: recipe2))
    sortOrder = .cuisine
    #expect(!sortOrder.compare(recipe1: recipe1, recipe2: recipe2))
  }

  @Test func testDisplayName() {
    let expectedNameDisplayName = "Name"
    let expectedCuisineDisplayName = "Cuisine"
    #expect(expectedNameDisplayName == SortOrder.name.displayName)
    #expect(expectedCuisineDisplayName == SortOrder.cuisine.displayName)
  }
}
