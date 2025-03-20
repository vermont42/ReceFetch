// Copyright © 2025 Josh Adams. All rights reserved.

import Testing

@testable import ReceFetch
struct SettingsTests {
  @Test func testRecipesURLSetting() {
    let settings = Settings(getterSetter: GetterSetterFake())
    #expect(Settings.recipesURLDefault == settings.recipesURL)
    #expect(RecipesURL.withMore == settings.recipesURL)
    settings.recipesURL = .withMore
    #expect(Settings.recipesURLDefault == settings.recipesURL)
    #expect(RecipesURL.withMore == settings.recipesURL)
    Current.settings.recipesURL = Settings.recipesURLDefault
  }

  @Test func testSessionTypeSetting() {
    let settings = Settings(getterSetter: GetterSetterFake())
    #expect(Settings.sessionTypeDefault == settings.sessionType)
    #expect(SessionType.shared == settings.sessionType)
    settings.sessionType = .stub
    #expect (Settings.sessionTypeDefault != settings.sessionType)
    #expect(SessionType.stub == settings.sessionType)
    Current.settings.sessionType = Settings.sessionTypeDefault
  }

  @Test func testPersistentCacheMethodSetting() {
    let settings = Settings(getterSetter: GetterSetterFake())
    #expect(Settings.persistentCacheMethodDefault == settings.persistentCacheMethod)
    #expect(PersistentCacheMethod.none == settings.persistentCacheMethod)
    settings.persistentCacheMethod = .filesystem
    #expect(Settings.persistentCacheMethodDefault != settings.persistentCacheMethod)
    #expect(PersistentCacheMethod.filesystem == settings.persistentCacheMethod)
    Current.settings.persistentCacheMethod = Settings.persistentCacheMethodDefault
  }

  @Test func testSortOrderSetting() {
    let settings = Settings(getterSetter: GetterSetterFake())
    #expect(Settings.sortOrderDefault == settings.sortOrder)
    #expect(SortOrder.name == settings.sortOrder)
    settings.sortOrder = .cuisine
    #expect(Settings.sortOrderDefault != settings.sortOrder)
    #expect(SortOrder.cuisine == settings.sortOrder)
    Current.settings.sortOrder = Settings.sortOrderDefault
  }
}
