// Copyright © 2025 Josh Adams. All rights reserved.

@testable import ReceFetch
import Testing

struct GetterSetterFakeTests {
  @Test func testGetAndSet() {
    let settings = Settings(getterSetter: GetterSetterFake())
    let initialOrder = settings.sortOrder
    #expect(SortOrder.name == initialOrder)
    settings.sortOrder = .cuisine
    #expect(settings.sortOrder == .cuisine)
  }
  
  @Test func testInitialization() {
    let 🦖 = "🦖"
    let 🪐 = "🪐"
    let getterSetter = GetterSetterFake(dictionary: [🦖: 🪐])
    #expect(getterSetter.get(key: 🦖) == 🪐)
  }
}
