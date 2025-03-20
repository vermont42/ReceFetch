// Copyright © 2025 Josh Adams. All rights reserved.

import AVFoundation

class SoundPlayerReal: SoundPlayer {
  private var sounds: [String: AVAudioPlayer]

  init () {
    sounds = [:]
  }

  func play(_ sound: Sound) {
    if sounds[sound.rawValue] == nil {
      if let audioURL = Bundle.main.url(forResource: sound.rawValue, withExtension: sound.fileExtension) {
        try? sounds[sound.rawValue] = AVAudioPlayer.init(contentsOf: audioURL)
      }
    }

    if let retrievedSound = sounds[sound.rawValue] {
      retrievedSound.play()
    }
  }
}
