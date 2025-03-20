// Copyright © 2025 Josh Adams. All rights reserved.

import Foundation
@testable import ReceFetch
import Testing

class URLProtocolStubTests {
  private let backupURLDataDict: [URL: Data]

  private var url: URL {
    let urlString = "https://racecondition.software"
    if let url = URL(string: urlString) {
      return url
    } else {
      fatalError(URL.couldNotInit(urlString: urlString))
    }
  }

  private var request: URLRequest {
    URLRequest(url: url)
  }

  init() {
    backupURLDataDict = URLSession.urlDataDict
  }

  deinit {
    URLSession.urlDataDict = backupURLDataDict
  }

  @Test func testCanInit() {
    #expect(URLProtocolStub.canInit(with: request))
  }

  @Test func testCanonicalRequest() {
    #expect(request == URLProtocolStub.canonicalRequest(for: request))
  }

  @Test func testStartLoading() {
    let bundleData = Data()
    URLSession.urlDataDict = [url: bundleData]
    let protocolClientStub = ProtocolClientStub(didLoad: { loadedData in
      #expect(bundleData == loadedData)
    })
    let urlProtocolStub = URLProtocolStub(request: request, cachedResponse: nil, client: protocolClientStub)
    urlProtocolStub.startLoading()
  }

  private class ProtocolClientStub: NSObject, URLProtocolClient {
    let didLoad: (Data) -> Void
  
    init(didLoad: @escaping (Data) -> Void) {
      self.didLoad = didLoad
    }
  
    func urlProtocol(_ protocol: URLProtocol, didLoad data: Data) {
      didLoad(data)
    }
  
    func urlProtocolDidFinishLoading(_ protocol: URLProtocol) {}
    func urlProtocol(_ protocol: URLProtocol, wasRedirectedTo request: URLRequest, redirectResponse: URLResponse) {}
    func urlProtocol(_ protocol: URLProtocol, cachedResponseIsValid cachedResponse: CachedURLResponse) {}
    func urlProtocol(_ protocol: URLProtocol, didReceive response: URLResponse, cacheStoragePolicy policy: URLCache.StoragePolicy) {}
    func urlProtocol(_ protocol: URLProtocol, didFailWithError error: Error) {}
    func urlProtocol(_ protocol: URLProtocol, didReceive challenge: URLAuthenticationChallenge) {}
    func urlProtocol(_ protocol: URLProtocol, didCancel challenge: URLAuthenticationChallenge) {}
  }
}
