// Copyright © 2025 Josh Adams. All rights reserved.

import Foundation

class GetterSetterReal: GetterSetter {
  func get(key: String) -> String? {
    return UserDefaults.standard.string(forKey: key)
  }

  func set(key: String, value: String) {
    UserDefaults.standard.set(value, forKey: key)
  }
}
