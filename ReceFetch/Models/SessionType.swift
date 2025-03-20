// Copyright © 2025 Josh Adams. All rights reserved.

import Foundation

enum SessionType: String, CaseIterable {
  case shared
  case stub

  var session: URLSession {
    switch self {
    case .shared:
      return URLSession.sharedNoCache
    case .stub:
      return URLSession.stub
    }
  }

  var displayName: String {
    switch self {
    case .shared:
      return "Shared"
    case .stub:
      return "Stub"
    }
  }
}
