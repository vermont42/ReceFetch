// Copyright © 2025 Josh Adams. All rights reserved.

@testable import ReceFetch
import Testing

struct SoundPlayerRealTests {
  @Test func testPlay() {
    let soundPlayer = SoundPlayerReal()
    soundPlayer.play(.chime)
    soundPlayer.play(.sadTrombone)
  }
}
