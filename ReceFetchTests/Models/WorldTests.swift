// Copyright © 2025 Josh Adams. All rights reserved.

@testable import ReceFetch
import Testing

struct WorldTests {
  @Test func testProductionWorld() {
    let world = World.production
    #expect(world.settings.getterSetter is GetterSetterReal)
    #expect(world.soundPlayer is SoundPlayerReal)
  }

  @Test func testUnitTestWorld() {
    let world = World.unitTest
    #expect(world.settings.getterSetter is GetterSetterFake)
    #expect(world.soundPlayer is SoundPlayerDummy)
  }
}
