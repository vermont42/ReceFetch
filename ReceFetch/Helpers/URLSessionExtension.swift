// Copyright © 2025 Josh Adams. All rights reserved.

import Foundation

extension URLSession {
  static var urlDataDict: [URL: Data] = [:]
  static var didProcessURLs = false

  static var sharedNoCache: URLSession = {
    let config = URLSessionConfiguration.default
    config.requestCachePolicy = .reloadIgnoringLocalCacheData
    config.urlCache = nil
    return URLSession.init(configuration: config)
  }()

  static var stub: URLSession {
    if !didProcessURLs {
      didProcessURLs = true
      RecipesURL.allCases.forEach {
        if let path = Bundle.main.path(forResource: $0.url.lastPathComponent, ofType: nil) {
          do {
            let data = try Data(contentsOf: URL(fileURLWithPath: path))
            URLSession.urlDataDict[$0.url] = data
          } catch {
            fatalError("Unable to load mock JSON data for URL \($0.url).")
          }
        }
      }

      for image in MockData.images {
        let sanitizedImage = image.replacingOccurrences(of: "/", with: "~")
        if
          let bundleURL = Bundle.main.url(forResource: sanitizedImage, withExtension: nil),
          let actualURL = MockData.urlForImage(image)
        {
          do {
            let data = try Data(contentsOf: bundleURL)
            URLSession.urlDataDict[actualURL] = data
          } catch {
            fatalError("Unable to initialize Data for \(bundleURL).")
          }
        } else {
          fatalError("Unable to initialize URL for \(image).")
        }
      }
    }

    let config = URLSessionConfiguration.ephemeral
    config.requestCachePolicy = .reloadIgnoringLocalCacheData
    config.urlCache = nil
    config.protocolClasses = [URLProtocolStub.self]
    return URLSession(configuration: config)
  }
}
