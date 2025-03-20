// Copyright © 2025 Josh Adams. All rights reserved.

import SwiftUI

struct RecipeDetailsView: View {
  @State private var image: UIImage?
  @Environment(\.openURL) var openURL
  let recipe: Recipe
  let imageLoader: ImageLoader
  private static let percentOfHorizontalWidthToUse = 0.80
  private let imageHeightWidth = UIScreen.main.bounds.size.width * percentOfHorizontalWidthToUse

  var body: some View {
    VStack {
      Text(recipe.name)
        .font(.title)
        .fixedSize(horizontal: false, vertical: true)
        .multilineTextAlignment(.center)
        .padding()

      Group {
        if let image {
          Image(uiImage: image)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .padding()
        } else {
          ProgressView()
        }
      }
      .frame(width: imageHeightWidth, height: imageHeightWidth)

      Text(recipe.cuisine)
        .font(.title2)
        .padding()

      if let sourceURL = recipe.sourceURL {
        Button("View Recipe") {
          openURL(sourceURL)
        }
        .padding()
      }

      if let youtubeURL = recipe.youtubeURL {
        Button("Watch YouTube") {
          openURL(youtubeURL)
        }
      }
    }
    .task {
      if let url = recipe.photoURLLarge {
        image = await imageLoader.loadImage(url: url)
      }
    }
  }
}

#Preview {
  NavigationStack {
    RecipeDetailsView(recipe: MockData.recipe, imageLoader: ImageLoader())
  }
}
