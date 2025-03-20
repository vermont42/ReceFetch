// Copyright © 2025 Josh Adams. All rights reserved.

import SwiftUI

struct BrowseRecipesView: View {
  @State private var viewModel = BrowseRecipesViewModel()
  @State private var images: [URL: UIImage] = [:]
  private let imageLoader = ImageLoader()
  private let imageHeightWidth: CGFloat = 150.0
  private let mockedState: BrowseRecipesViewModel.LoadingState?

  init(mockedState: BrowseRecipesViewModel.LoadingState? = nil) {
    self.mockedState = mockedState
  }

  var body: some View {
    Group {
      NavigationStack {
        switch viewModel.loadingState {
        case .loading:
          ProgressView()
        case .error:
          ErrorRetryView(message: "An error occurred during recipe fetching.", viewModel: viewModel)
        case .loaded(let recipes):
          if !recipes.isEmpty {
            list(of: recipes)
              .navigationTitle("Recipes")
          } else {
            ErrorRetryView(message: "The endpoint returned an empty array of recipes.", viewModel: viewModel)
          }
        }
      }
    }
    .task {
      await viewModel.loadRecipes(mockedState: mockedState)
    }
  }

  func list(of recipes: [Recipe]) -> some View {
    List(recipes) { recipe in
      NavigationLink {
        RecipeDetailsView(recipe: recipe, imageLoader: imageLoader)
      } label: {
        HStack {
          VStack(alignment: .leading) {
            Text(recipe.name)
              .font(.body)
            Text(recipe.cuisine)
              .font(.caption)
          }

          Spacer()

          Group {
            if
              let url = recipe.photoURLSmall,
              let image = images[url]
            {
              Image(uiImage: image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding()
            } else {
              ProgressView()
            }
          }
          .frame(width: imageHeightWidth, height: imageHeightWidth)
          .task {
            if let url = recipe.photoURLSmall {
              images[url] = await imageLoader.loadImage(url: url)
            }
          }
        }
      }
    }
  }
}

#Preview("Mocked Data") {
  BrowseRecipesView(mockedState: .loaded(MockData.recipes))
}

#Preview("Actual Data") {
  BrowseRecipesView()
}

#Preview("No Data") {
  BrowseRecipesView(mockedState: .loaded([]))
}

#Preview("Error") {
  BrowseRecipesView(mockedState: .error)
}

#Preview("Loading") {
  BrowseRecipesView(mockedState: .loading)
}
