// Copyright © 2025 Josh Adams. All rights reserved.

@testable import ReceFetch
import Testing

struct BrowseRecipesViewModelTests {
  @Test func testLoadRecipes() async {
    let vm = BrowseRecipesViewModel()

    let loadingState = vm.loadingState
    switch loadingState {
    case .loading:
      break
    default:
      Issue.record("Unexpected state: \(loadingState)")
      return
    }

    Current.settings.recipesURL = .withMore
    await vm.loadRecipes()
    let actualLoadedState = vm.loadingState
    switch actualLoadedState {
    case .loading, .error:
      Issue.record("Unexpected state: \(actualLoadedState)")
      return
    case .loaded(let recipes):
      #expect(recipes.count == MockData.recipes.count)
    }

    Current.settings.recipesURL = .malformed
    await vm.loadRecipes()
    let errorState = vm.loadingState
    switch errorState {
    case .loading, .loaded:
      Issue.record("Unexpected state: \(errorState)")
      return
    case .error:
      break
    }

    Current.settings.recipesURL = .empty
    await vm.loadRecipes()
    let emptyLoadedState = vm.loadingState
    switch emptyLoadedState {
    case .loading, .error:
      Issue.record("Unexpected state: \(emptyLoadedState)")
      return
    case .loaded(let recipes):
      #expect(recipes.isEmpty)
    }

    Current.settings.recipesURL = .withMore
  }
}
