// Copyright © 2025 Josh Adams. All rights reserved.

enum Sound: String {
  case chime
  case sadTrombone
  case tearing

  var fileExtension: String {
    switch self {
    case .chime:
      return "mp3"
    case .sadTrombone:
      return "mp3"
    case .tearing:
      return "wav"
    }
  }
}
