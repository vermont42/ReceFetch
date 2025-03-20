// Copyright © 2025 Josh Adams. All rights reserved.

@testable import ReceFetch
import Testing

struct SoundPlayerDummyTests {
  @Test func testPlay() {
    let soundPlayer = SoundPlayerDummy()
    soundPlayer.play(.chime)
    soundPlayer.play(.sadTrombone)
  }
}
