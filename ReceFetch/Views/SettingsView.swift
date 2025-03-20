// Copyright © 2025 Josh Adams. All rights reserved.

import SwiftUI

struct SettingsView: View {
  @Bindable private var current = Current
  @State private var viewModel = SettingsViewModel()

  var body: some View {
    ScrollView(.vertical) {
      Text("Settings")
        .font(.largeTitle)

      Spacer()
        .frame(height: Layout.tripleStandard)

      Group {
        Text("Recipes URL")
          .font(.title)

        Picker("", selection: $current.settings.recipesURL) {
          ForEach(RecipesURL.allCases, id: \.self) { recipesURL in
            Text(recipesURL.displayName).tag(recipesURL)
          }
        }
        .segmentedPicker()

        Text("This setting controls the URL of the JSON file that the recipes-browsing screen retrieves. Revisit that screen after changing this setting to initiate another API call.")
          .padding()
      }

      Group {
        Text("URLSession Type")
          .font(.title)

        Picker("", selection: $current.settings.sessionType) {
          ForEach(SessionType.allCases, id: \.self) { sessionType in
            Text(sessionType.displayName).tag(sessionType)
          }
        }
        .segmentedPicker()

        Text("This setting controls which URLSession to use for JSON retrieval and image fetching: shared or stub. System-level caching is disabled for both.")
          .padding()
      }

      Group {
        Text("Sort Order")
          .font(.title)

        Picker("", selection: $current.settings.sortOrder) {
          ForEach(SortOrder.allCases, id: \.self) { sortOrder in
            Text(sortOrder.displayName).tag(sortOrder)
          }
        }
        .segmentedPicker()

        Text("This setting controls the sort order of recipes on ReceFetch's recipe-browsing screen.")
          .padding()
      }

      Group {
         Text("Persistent Cache Method")
           .font(.title)

        Picker("", selection: $current.settings.persistentCacheMethod) {
           ForEach(PersistentCacheMethod.allCases, id: \.self) { persistentCacheMethod in
             Text(persistentCacheMethod.displayName).tag(persistentCacheMethod)
           }
         }
         .segmentedPicker()

         Text("This setting controls whether to use the filesystem to cache images between launches of the app. When activated, this cache makes image loading ridiculously fast.")
           .padding()
       }

       Group {
         if !viewModel.isTempDirectoryEmpty {
           Text("Cache Directory")
             .font(.title)

           Spacer()

           Button("Clear") {
             viewModel.clearTempDirectory()
             Current.soundPlayer.play(.tearing)
           }
           .destructiveButton()

           Text("Tap this button to clear the contents of the temporary directory, which acts as a persistent image cache.")
             .padding()
         }
       }

      Spacer()
    }
    .onAppear {
      viewModel.configure()
    }
  }
}

#Preview {
  SettingsView()
}
