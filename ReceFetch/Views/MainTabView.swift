// Copyright © 2025 Josh Adams. All rights reserved.

import SwiftUI

struct MainTabView: View {
  var body: some View {
    TabView {
      BrowseRecipesView()
        .tabItem {
          Image(systemName: "pawprint.fill")
          Text("Browse")
        }

      SettingsView()
        .tabItem {
          Image(systemName: "gearshape.2.fill")
          Text("Settings")
        }
    }
  }
}

#Preview {
  MainTabView()
}
