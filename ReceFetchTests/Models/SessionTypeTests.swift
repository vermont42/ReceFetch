// Copyright © 2025 Josh Adams. All rights reserved.

import Foundation
@testable import ReceFetch
import Testing

struct SessionTypeTests {
  @Test func testDisplayName() {
    let expectedSharedDisplayName = "Shared"
    let expectedStubDisplayName = "Stub"
    #expect(expectedSharedDisplayName == SessionType.shared.displayName)
    #expect(expectedStubDisplayName == SessionType.stub.displayName)
  }

  @Test func testSession() {
    #expect(SessionType.shared.session == URLSession.sharedNoCache)
    #expect(SessionType.stub.session != URLSession.sharedNoCache)
  }
}
