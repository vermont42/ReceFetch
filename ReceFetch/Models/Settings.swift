// Copyright © 2025 Josh Adams. All rights reserved.

import Foundation

class Settings {
  let getterSetter: GetterSetter

  var recipesURL: RecipesURL {
    didSet {
      if recipesURL != oldValue {
        getterSetter.set(key: Settings.recipesURLKey, value: recipesURL.rawValue)
      }
    }
  }
  static let recipesURLKey = "recipesURL"
  static let recipesURLDefault: RecipesURL = .withMore

  var sessionType: SessionType {
    didSet {
      if sessionType != oldValue {
        getterSetter.set(key: Settings.sessionTypeKey, value: sessionType.rawValue)
        Task {
          await Current.imageLoader.clearCache()
        }
      }
    }
  }
  static let sessionTypeKey = "sessionType"
  static let sessionTypeDefault: SessionType = .shared

  var persistentCacheMethod: PersistentCacheMethod {
    didSet {
      if persistentCacheMethod != oldValue {
        getterSetter.set(key: Settings.persistentCacheMethodKey, value: persistentCacheMethod.rawValue)
      }
    }
  }
  static let persistentCacheMethodKey = "persistentCacheMethod"
  static let persistentCacheMethodDefault: PersistentCacheMethod = .none

  var sortOrder: SortOrder {
    didSet {
      if sortOrder != oldValue {
        getterSetter.set(key: Settings.sortOrderKey, value: sortOrder.rawValue)
      }
    }
  }
  static let sortOrderKey = "sortOrder"
  static let sortOrderDefault: SortOrder = .name

  init(getterSetter: GetterSetter) {
    self.getterSetter = getterSetter

    if let recipesURLString = getterSetter.get(key: Settings.recipesURLKey) {
      recipesURL = RecipesURL(rawValue: recipesURLString) ?? Settings.recipesURLDefault
    } else {
      recipesURL = Settings.recipesURLDefault
      getterSetter.set(key: Settings.recipesURLKey, value: recipesURL.rawValue)
    }

    if let sessionTypeString = getterSetter.get(key: Settings.sessionTypeKey) {
      sessionType = SessionType(rawValue: sessionTypeString) ?? Settings.sessionTypeDefault
    } else {
      sessionType = Settings.sessionTypeDefault
      getterSetter.set(key: Settings.sessionTypeKey, value: sessionType.rawValue)
    }

    if let sortOrderString = getterSetter.get(key: Settings.sortOrderKey) {
      sortOrder = SortOrder(rawValue: sortOrderString) ?? Settings.sortOrderDefault
    } else {
      sortOrder = Settings.sortOrderDefault
      getterSetter.set(key: Settings.sortOrderKey, value: sortOrder.rawValue)
    }

    if let persistentCacheMethodString = getterSetter.get(key: Settings.persistentCacheMethodKey) {
      persistentCacheMethod = PersistentCacheMethod(rawValue: persistentCacheMethodString) ?? Settings.persistentCacheMethodDefault
    } else {
      persistentCacheMethod = Settings.persistentCacheMethodDefault
      getterSetter.set(key: Settings.persistentCacheMethodKey, value: persistentCacheMethod.rawValue)
    }
  }
}
