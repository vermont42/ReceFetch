// Copyright © 2025 Josh Adams. All rights reserved.

import SwiftUI

struct ErrorRetryView: View {
  let message: String
  let viewModel: BrowseRecipesViewModel

  var body: some View {
    VStack {
      Text(message)
        .padding()

      Spacer()
        .frame(height: Layout.standard)

      Button("Retry") {
        Task {
          await viewModel.loadRecipes()
        }
      }
    }
  }
}

#Preview {
  ErrorRetryView(message: "This is a test error message.", viewModel: BrowseRecipesViewModel())
}
