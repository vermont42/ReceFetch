// Copyright © 2025 Josh Adams. All rights reserved.

enum SortOrder: String, CaseIterable {
  case name
  case cuisine

  var displayName: String {
    switch self {
    case .name:
      return "Name"
    case .cuisine:
      return "Cuisine"
    }
  }

  func compare(recipe1: Recipe, recipe2: Recipe) -> Bool {
    switch self {
    case .name:
      return recipe1.name.caseInsensitiveCompare(recipe2.name) == .orderedAscending
    case .cuisine:
      return recipe1.cuisine < recipe2.cuisine
    }
  }
}
