//

import Foundation

struct Book: Codable {
  let title: String
  let releaseYear: Int

  init(title: String, releaseYear: Int) {
    self.title = title
    self.releaseYear = releaseYear
  }

  private enum CodingKeys: String, CodingKey {
    case title = "alternate-title"
    case releaseYear = "alternate-release-year"
  }

  init(from decoder: any Decoder) throws {
    let container: KeyedDecodingContainer<CodingKeys> = try decoder.container(keyedBy: CodingKeys.self)

    self.title = try container.decode(String.self, forKey: .title)
    self.releaseYear = try container.decode(Int.self, forKey: .releaseYear)

  }

  func encode(to encoder: any Encoder) throws {
    var container: KeyedEncodingContainer<CodingKeys> = encoder.container(keyedBy: CodingKeys.self)

    try container.encode(self.title, forKey: .title)
    try container.encode(self.releaseYear, forKey: .releaseYear)
  }
}

struct Friend: Codable {
  let name: String
  let favorites: [String]

  enum CodingKeys: String, CodingKey {
    case name
    case favorites
  }
}

struct TeaParty: Codable {
  let friends: [Friend]

  enum CodingKeys: String, CodingKey {
    case friends
  }

  func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)

    var friendsArrayContainer = container.nestedUnkeyedContainer(forKey: .friends)

    for friend in self.friends {
      var friendContainer = friendsArrayContainer.nestedContainer(keyedBy: Friend.CodingKeys.self)

      try friendContainer.encode(friend.name, forKey: .name)

      // Adding a custom transformation: reversing the favorites list
      var favoritesContainer = friendContainer.nestedUnkeyedContainer(forKey: .favorites)

      for favorite in friend.favorites.reversed() {
        try favoritesContainer.encode(favorite)
      }
    }
  }
}
