// Copyright © 2025 Josh Adams. All rights reserved.

@testable import ReceFetch
import Testing

struct RecipeTests {
  @Test func testEquality() async throws {
    let mockSlug = MockData.recipe
    let networkSlug = try await RecipeLoader.loadRecipes()[0]
    #expect(mockSlug == networkSlug)
  }
}
