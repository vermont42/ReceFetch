// Copyright © 2025 Josh Adams. All rights reserved.

import SwiftUI

extension View {
  func segmentedPicker() -> some View {
    modifier(SegmentedPicker())
  }

  func destructiveButton() -> some View {
    modifier(DestructiveButton())
  }
}

private struct SegmentedPicker: ViewModifier {
  func body(content: Content) -> some View {
    content
      .pickerStyle(SegmentedPickerStyle())
      .padding(.horizontal, Layout.doubleStandard)
  }
}

private struct DestructiveButton: ViewModifier {
  func body(content: Content) -> some View {
    content
      .foregroundColor(.red)
      .buttonStyle(.bordered)
      .tint(.red)
  }
}

private struct SegmentedPickerAndDestructiveButtonView: View {
  @State var selection = RecipesURL.withMore

  var body: some View {
    VStack {
      Text("segmentedPicker()")
        .font(.headline)

      Picker("", selection: $selection) {
        ForEach(RecipesURL.allCases, id: \.self) { recipesURL in
          Text(recipesURL.displayName)
        }
      }
      .segmentedPicker()

      Spacer()
        .frame(height: Layout.tripleStandard)

      Text("destructiveButton")
        .font(.headline)

      Button("Don't Tap This") {
        Current.soundPlayer.play(.sadTrombone)
      }
      .destructiveButton()

      Button("Don't Tap This Either") {
        Current.soundPlayer.play(.tearing)
      }
      .destructiveButton()
    }
  }
}

#Preview {
  SegmentedPickerAndDestructiveButtonView()
}
