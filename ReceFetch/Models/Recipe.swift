// Copyright © 2025 Josh Adams. All rights reserved.

import Foundation

class Recipe: Codable, Identifiable, Equatable {
  var id: String { uuid }
  let uuid: String
  let name: String
  let cuisine: String
  let photoURLLargeString: String
  let photoURLSmallString: String
  let sourceURLString: String?
  let youtubeURLString: String?

  lazy var photoURLLarge: URL? = {
    URL(string: photoURLLargeString)
  }()

  lazy var photoURLSmall: URL? = {
    URL(string: photoURLSmallString)
  }()

  lazy var sourceURL: URL? = {
    if let sourceURLString {
      return URL(string: sourceURLString)
    } else {
      return nil
    }
  }()

  lazy var youtubeURL: URL? = {
    if let youtubeURLString {
      return URL(string: youtubeURLString)
    } else {
      return nil
    }
  }()

  enum CodingKeys: String, CodingKey {
    case uuid
    case name
    case cuisine
    case photoURLLargeString = "photo_url_large"
    case photoURLSmallString = "photo_url_small"
    case sourceURLString = "source_url"
    case youtubeURLString = "youtube_url"
  }

  static func == (lhs: Recipe, rhs: Recipe) -> Bool {
    lhs.uuid == rhs.uuid
  }

  init(
    uuid: String,
    name: String,
    cuisine: String,
    photoURLLargeString: String,
    photoURLSmallString: String,
    sourceURLString: String?,
    youtubeURLString: String?
  ) {
    self.uuid = uuid
    self.name = name
    self.cuisine = cuisine
    self.photoURLLargeString = photoURLLargeString
    self.photoURLSmallString = photoURLSmallString
    self.sourceURLString = sourceURLString
    self.youtubeURLString = youtubeURLString
  }
}
