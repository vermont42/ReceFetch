// Copyright © 2025 Josh Adams. All rights reserved.

import Foundation

enum RecipesURL: String, CaseIterable {
  case standard
  case empty
  case malformed
  case withMore

  var url: URL {
    let standardURLString = "https://d3jbb8n5wk0qxi.cloudfront.net/recipes.json"
    let emptyURLString = "https://d3jbb8n5wk0qxi.cloudfront.net/recipes-empty.json"
    let malformedURLString = "https://d3jbb8n5wk0qxi.cloudfront.net/recipes-malformed.json"
    let withMoreURLString = "https://raceconditionsoftware.s3.us-west-1.amazonaws.com/ReceFetch/recipes_with_more.json"

    let urlString: String

    switch self {
    case .standard:
      urlString = standardURLString
    case .empty:
      urlString = emptyURLString
    case .malformed:
      urlString = malformedURLString
    case .withMore:
      urlString = withMoreURLString
    }

    if let url = URL(string: urlString) {
      return url
    } else {
      fatalError(URL.couldNotInit(urlString: urlString))
    }
  }

  var displayName: String {
    switch self {
    case .standard:
      return "Standard"
    case .empty:
      return "Empty"
    case .malformed:
      return "Malformed"
    case .withMore:
      return "With More"
    }
  }
}
