// Copyright © 2025 Josh Adams. All rights reserved.

@testable import ReceFetch
import Testing

struct SoundTests {
  @Test func testFileExtension() {
    var sound = Sound.chime
    #expect(sound.fileExtension == "mp3")
    sound = Sound.sadTrombone
    #expect(sound.fileExtension == "mp3")
    sound = Sound.tearing
    #expect(sound.fileExtension == "wav")
  }
}
