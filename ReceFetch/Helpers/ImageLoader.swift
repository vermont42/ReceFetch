// Copyright © 2025 Josh Adams. All rights reserved.

import UIKit

actor ImageLoader {
  enum LoadingState {
    case inProgress(Task<UIImage, Error>)
    case loaded(UIImage)
  }

  private var loadingStates: [URL: LoadingState] = [:]
  private let errorImage = UIImage(resource: .error)

  func loadImage(url: URL) async -> UIImage {
    var task: Task<UIImage, Error>?

    if let loadingState = loadingStates[url] {
      switch loadingState {
      case .loaded(let image):
        return image
      case .inProgress(let loadingTask):
        task = loadingTask
      }
    }

    if let image = imageFromPersistentCache(for: url) {
      loadingStates[url] = .loaded(image)
      return image
    }

    if task == nil {
      let newTask = Task<UIImage, Error> {
        do {
          let (imageData, _) = try await Current.settings.sessionType.session.data(from: url)
          let image = UIImage(data: imageData)
          image.map { persistImage($0, for: url) }
          return image ?? errorImage
        } catch {
          return errorImage
        }
      }
      loadingStates[url] = .inProgress(newTask)
      task = newTask
    }

    guard let task else {
      return errorImage
    }

    do {
      let image = try await task.value
      return image
    } catch {
      return errorImage
    }
  }

  func imageFromPersistentCache(for url: URL) -> UIImage? {
    guard let persistentCacheKey = persistentCacheKey(for: url) else {
      return nil
    }

    switch Current.settings.persistentCacheMethod {
    case .filesystem:
      let data = try? Data(contentsOf: persistentCacheKey)
      if let data {
        return UIImage(data: data)
      } else {
        return nil
      }
    case .none:
      return nil
    }
  }

  private func persistentCacheKey(for url: URL) -> URL? {
    switch Current.settings.persistentCacheMethod {
    case .filesystem:
      guard let fileName = url.absoluteString.addingPercentEncoding(
        withAllowedCharacters: .urlPathAllowed)?.replacingOccurrences(of: "/", with: "*"
      ) else {
        return nil
      }
      return FileManager.default.temporaryDirectory.appendingPathComponent(fileName)
    case .none:
      return nil
    }
  }

  func persistImage(_ image: UIImage, for url: URL) {
    switch Current.settings.persistentCacheMethod {
    case .filesystem:
      let goodEnoughQuality = 0.8
      guard
        let data = image.jpegData(compressionQuality: goodEnoughQuality),
        let persistentCacheKey = persistentCacheKey(for: url)
      else {
        return
      }
      try? data.write(to: persistentCacheKey)
    case .none:
      return
    }
  }

  func clearCache() async {
    loadingStates = [:]
  }
}
