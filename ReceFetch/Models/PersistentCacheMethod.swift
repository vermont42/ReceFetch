// Copyright © 2025 Josh Adams. All rights reserved.

enum PersistentCacheMethod: String, CaseIterable {
  case filesystem
  case none

  var displayName: String {
    switch self {
    case .filesystem:
      return "Filesystem"
    case .none:
      return "None"
    }
  }
}
