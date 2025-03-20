// Copyright © 2025 Josh Adams. All rights reserved.

import SwiftUI

struct ReceFetchTestApp: App {
  var body: some Scene {
    WindowGroup {
      ZStack {
        Color.black

        VStack {
          Text("Running Unit Tests")
            .font(.largeTitle)
            .foregroundStyle(.receFetchPurple)
          ProgressView()
            .tint(.receFetchYellow)
            .controlSize(.large)
        }
      }
    }
  }
}
