// Copyright © 2025 Josh Adams. All rights reserved.

import Foundation

enum RecipeLoader {
  static func loadRecipes() async throws -> [Recipe] {
    let (data, _) = try await Current.settings.sessionType.session.data(from: Current.settings.recipesURL.url)
    let recipes = try JSONDecoder().decode(Recipes.self, from: data)
    return recipes.recipes
  }
}
