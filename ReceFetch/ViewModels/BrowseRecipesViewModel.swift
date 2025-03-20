// Copyright © 2025 Josh Adams. All rights reserved.

import Observation

@Observable class BrowseRecipesViewModel {
  enum LoadingState {
    case error
    case loading
    case loaded([Recipe])
  }

  var loadingState = LoadingState.loading

  func loadRecipes(mockedState: LoadingState? = nil) async {
    if let mockedState {
      self.loadingState = mockedState
    } else {
      loadingState = .loading
      do {
        var recipes = try await RecipeLoader.loadRecipes()
        recipes.sort { recipe1, recipe2 in
          Current.settings.sortOrder.compare(recipe1: recipe1, recipe2: recipe2)
        }
        loadingState = .loaded(recipes)
      } catch {
        loadingState = .error
      }
    }

    switch loadingState {
    case .loading:
      break
    case .loaded(recipes: let recipes):
      if recipes.isEmpty {
        Current.soundPlayer.play(.sadTrombone)
      } else {
        Current.soundPlayer.play(.chime)
      }
    case .error:
      Current.soundPlayer.play(.sadTrombone)
    }
  }
}
