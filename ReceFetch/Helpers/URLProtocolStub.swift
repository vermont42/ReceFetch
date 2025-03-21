// Copyright © 2025 Josh Adams. All rights reserved.

import Foundation

class URLProtocolStub: URLProtocol {
  override class func canInit(with request: URLRequest) -> Bool {
    true
  }

  override class func canonicalRequest(for request: URLRequest) -> URLRequest {
    request
  }

  override func startLoading() {
    if
      let url = request.url,
      let data = URLSession.urlDataDict[url]
    {
      client?.urlProtocol(self, didReceive: URLResponse(), cacheStoragePolicy: .notAllowed)
      client?.urlProtocol(self, didLoad: data)
    } else {
      client?.urlProtocol(self, didFailWithError: LoadingError.loadFailed)
    }
    client?.urlProtocolDidFinishLoading(self)
  }

  override func stopLoading() {}

  enum LoadingError: Error {
    case loadFailed
  }
}
