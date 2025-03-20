// Copyright © 2025 Josh Adams. All rights reserved.

import Foundation

enum MockData {
  static let mockPhotoExtension = ".jpg"
  static let adamsURLPrefix = "https://raceconditionsoftware.s3.us-west-1.amazonaws.com/ReceFetch/"
  static let fetchURLPrefix = "https://d3jbb8n5wk0qxi.cloudfront.net/photos/"


  static let images: [String] = [
    "img/BananaSlugSmall.jpg",
    "img/BananaSlugLarge.jpg",
    "img/TartSmall.jpg",
    "img/TartLarge.jpg",
    "dce36ed7-d5bd-4532-9e9f-fafd75a4eb8f/small.jpg", // Rock Cakes
    "dce36ed7-d5bd-4532-9e9f-fafd75a4eb8f/large.jpg", // Rock Cakes
    "b51b389c-a408-4664-b0d2-a437cbc352b0/small.jpg", // Rocky Road Fudge
    "b51b389c-a408-4664-b0d2-a437cbc352b0/large.jpg", // Rocky Road Fudge
    "15d50359-5f62-4583-a9e9-d761bc58fecf/small.jpg", // Rogaliki
    "15d50359-5f62-4583-a9e9-d761bc58fecf/large.jpg", // Rogaliki
    "b75ee8ef-a290-4062-8b26-60722d75d09c/small.jpg", // Salted Caramel Cheesecake
    "b75ee8ef-a290-4062-8b26-60722d75d09c/large.jpg", // Salted Caramel Cheesecake
    "658442fe-e3d3-44a5-9081-e2424fb0129d/small.jpg", // Seri Muka Kuih
    "658442fe-e3d3-44a5-9081-e2424fb0129d/large.jpg", // Seri Muka Kuih
    "d9e32cfd-818d-4428-8f49-b3a6ae624f58/small.jpg", // Sticky Toffee Pudding
    "d9e32cfd-818d-4428-8f49-b3a6ae624f58/large.jpg"  // Sticky Toffee Pudding
  ]

  static func urlForImage(_ lastTwoComponents: String) -> URL? {
    let urlString: String
    let adamsComponent = "img/"

    if lastTwoComponents.contains(adamsComponent) {
      urlString = adamsURLPrefix + lastTwoComponents
    } else {
      urlString = fetchURLPrefix + lastTwoComponents
    }

    guard let url = URL(string: urlString) else {
      return nil
    }

    return url
  }

  static var recipe: Recipe {
    Recipe(
      uuid: "abc123",
      name: "Banana Slug",
      cuisine: "Californian",
      photoURLLargeString: "https://raceconditionsoftware.s3.us-west-1.amazonaws.com/ReceFetch/img/BananaSlugLarge.jpg",
      photoURLSmallString: "https://raceconditionsoftware.s3.us-west-1.amazonaws.com/ReceFetch/img/BananaSlugSmall.jpg",
      sourceURLString: "https://en.wikipedia.org/wiki/Banana_slug",
      youtubeURLString: "https://youtu.be/tZ4Hn-3JURQ"
    )
  }

  static var recipes: [Recipe] {
    [
      MockData.recipe,
      Recipe(
        uuid: "cdc34bb5-c9e3-4465-9088-cf2e2aa8e4ee",
        name: "Rock Cakes",
        cuisine: "British",
        photoURLLargeString: "https://d3jbb8n5wk0qxi.cloudfront.net/photos/dce36ed7-d5bd-4532-9e9f-fafd75a4eb8f/large.jpg",
        photoURLSmallString: "https://d3jbb8n5wk0qxi.cloudfront.net/photos/dce36ed7-d5bd-4532-9e9f-fafd75a4eb8f/small.jpg",
        sourceURLString: "https://www.bbc.co.uk/food/recipes/rock_cakes_03094",
        youtubeURLString: "https://www.youtube.com/watch?v=tY3taZO3Aro"
      ),
      Recipe(
        uuid: "xyz456",
        name: "Lilikoi Caramel Macadamia Nut Tart",
        cuisine: "Hawaiian",
        photoURLLargeString: "https://raceconditionsoftware.s3.us-west-1.amazonaws.com/ReceFetch/img/TartLarge.jpg",
        photoURLSmallString: "https://raceconditionsoftware.s3.us-west-1.amazonaws.com/ReceFetch/img/TartSmall.jpg",
        sourceURLString: "https://www.hawaiitartcompany.com",
        youtubeURLString: "https://www.hawaiitartcompany.com"
      ),
      Recipe(
        uuid: "fe81ba97-ee9e-4af9-bc3a-4f7a86eeb820",
        name: "Rocky Road Fudge",
        cuisine: "American",
        photoURLLargeString: "https://d3jbb8n5wk0qxi.cloudfront.net/photos/b51b389c-a408-4664-b0d2-a437cbc352b0/large.jpg",
        photoURLSmallString: "https://d3jbb8n5wk0qxi.cloudfront.net/photos/b51b389c-a408-4664-b0d2-a437cbc352b0/small.jpg",
        sourceURLString: "http://tiphero.com/rocky-road-fudge/",
        youtubeURLString: "https://www.youtube.com/watch?v=N1aJ3nEYXyg"
      ),
      Recipe(
        uuid: "e084dc2c-37e7-4600-9b46-76e673e8e2d2",
        name: "Rogaliki",
        cuisine: "Polish",
        photoURLLargeString: "https://d3jbb8n5wk0qxi.cloudfront.net/photos/15d50359-5f62-4583-a9e9-d761bc58fecf/large.jpg",
        photoURLSmallString: "https://d3jbb8n5wk0qxi.cloudfront.net/photos/15d50359-5f62-4583-a9e9-d761bc58fecf/small.jpg",
        sourceURLString: "https://www.food.com/recipe/rogaliki-polish-croissant-cookies-with-jam-filling-200668",
        youtubeURLString: "https://www.youtube.com/watch?v=VAR10T9mfhU"
      ),
      Recipe(
        uuid: "23fb89ed-00ec-407e-8802-d0a510973df9",
        name: "Salted Caramel Cheesecake",
        cuisine: "American",
        photoURLLargeString: "https://d3jbb8n5wk0qxi.cloudfront.net/photos/b75ee8ef-a290-4062-8b26-60722d75d09c/large.jpg",
        photoURLSmallString: "https://d3jbb8n5wk0qxi.cloudfront.net/photos/b75ee8ef-a290-4062-8b26-60722d75d09c/small.jpg",
        sourceURLString: "http://www.janespatisserie.com/2015/11/09/no-bake-salted-caramel-cheesecake/",
        youtubeURLString: "https://www.youtube.com/watch?v=q5dQp3qpmI4"
      ),
      Recipe(
        uuid: "c4560eaa-3c0f-4266-beba-4ddce62063e0",
        name: "Seri Muka Kuih",
        cuisine: "Malaysian",
        photoURLLargeString: "https://d3jbb8n5wk0qxi.cloudfront.net/photos/658442fe-e3d3-44a5-9081-e2424fb0129d/large.jpg",
        photoURLSmallString: "https://d3jbb8n5wk0qxi.cloudfront.net/photos/658442fe-e3d3-44a5-9081-e2424fb0129d/small.jpg",
        sourceURLString: "https://makan.ch/recipe/kuih-seri-muka/",
        youtubeURLString: "https://www.youtube.com/watch?v=_NJtCfqgaBo"
      ),
      Recipe(
        uuid: "ee112b29-829b-45c6-8c3d-3effe739c9f0",
        name: "Sticky Toffee Pudding",
        cuisine: "British",
        photoURLLargeString: "https://d3jbb8n5wk0qxi.cloudfront.net/photos/d9e32cfd-818d-4428-8f49-b3a6ae624f58/large.jpg",
        photoURLSmallString: "https://d3jbb8n5wk0qxi.cloudfront.net/photos/d9e32cfd-818d-4428-8f49-b3a6ae624f58/small.jpg",
        sourceURLString: "https://www.bbc.co.uk/food/recipes/marys_sticky_toffee_41970",
        youtubeURLString: "https://www.youtube.com/watch?v=Wytv3bjqJII"
      )
    ]
  }
}
