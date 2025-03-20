// Copyright © 2025 Josh Adams. All rights reserved.

@testable import ReceFetch
import Testing

struct GetterSetterRealTests {
  @Test func testGetAndSet() {
    let getterSetter = GetterSetterReal()
    let key = "key"
    let emptyValue = ""
    let actualValue = "🍕"
    getterSetter.set(key: key, value: emptyValue)
    #expect(emptyValue == getterSetter.get(key: key))
    getterSetter.set(key: key, value: actualValue)
    #expect(actualValue == getterSetter.get(key: key))
  }
}
