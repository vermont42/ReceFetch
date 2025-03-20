// Copyright © 2025 Josh Adams. All rights reserved.

@testable import ReceFetch
import Testing

struct SettingsViewModelTests {
  @Test func testConfigure() async {
    await FileManagerExtensionTests.persistCloudImage()
    let vm = SettingsViewModel()
    vm.configure()
    #expect(await !vm.getIsTempDirectoryEmpty())
    vm.clearTempDirectory()
    #expect(await vm.getIsTempDirectoryEmpty())
  }
}
