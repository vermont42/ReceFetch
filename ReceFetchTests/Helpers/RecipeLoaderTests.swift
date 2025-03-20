// Copyright © 2025 Josh Adams. All rights reserved.

@testable import ReceFetch
import Testing

struct RecipeLoaderTests {
  @Test func testLoadBreeds() async throws {
    Current.settings.recipesURL = .withMore
    let recipes = try await RecipeLoader.loadRecipes()
    let expectedCount = MockData.recipes.count
    #expect(expectedCount == recipes.count)
  }
}
