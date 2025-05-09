//  Created by Igor Sorokin

import Foundation

public protocol URLable {
  static var url: String { get }
  static var urlObject: URL { get }
}

extension URLable {
  public static var urlObject: URL {
    let apiURL = URL(string: "http://127.0.0.1:8080/api/")!

    var urlComponents = URLComponents(url: apiURL, resolvingAgainstBaseURL: false)!
    urlComponents.path = urlComponents.path.appending(Self.url)

    return urlComponents.url!
  }
}

public protocol MethodRequest where Self: Codable & URLable {
  var urlRequest: URLRequest { get throws }
}

public protocol PostRequest: MethodRequest { }
public protocol GetRequest: MethodRequest { }
public protocol GetWithIDRequest: MethodRequest {
  var id: String { get }
}

public extension PostRequest {
  var urlRequest: URLRequest {
    get throws {
      try URLRequest(url: Self.urlObject).with {
        $0.httpMethod = "POST"
        //      let version = "1.0.1"
        //      $0.setValue("MU/\(version) (iOS)", forHTTPHeaderField: "User-Agent")
        $0.setValue("application/json", forHTTPHeaderField: "Content-Type")
        $0.httpBody = try JSONEncoder().encode(self)
      }
    }
  }
}

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

public extension GetRequest {
  var urlRequest: URLRequest {
    get throws {
      var urlComponents = URLComponents(url: Self.urlObject, resolvingAgainstBaseURL: false)!

//      let query = Book(title: "Winnie the Pooh", releaseYear: 1926)

//      print("GetRequest query: \(query)")

      urlComponents.query = try QueryEncoder().with {
        $0.userInfo[.capitalizeName] = true
      }
      .encode(self)

      print("GetRequest encoded: \(urlComponents.query!)")

      print("GetRequest decoded: \(try QueryDecoder().decode(Self.self, from: urlComponents.query!))")

      return URLRequest(url: urlComponents.url!).with {
        $0.httpMethod = "GET"
      }
    }
  }
}

public extension GetWithIDRequest {
  var urlRequest: URLRequest {
    get throws {
      var urlComponents = URLComponents(url: Self.urlObject, resolvingAgainstBaseURL: false)!
      urlComponents.path = urlComponents.path.appending("/\(id)")
      urlComponents.query = try QueryEncoder().encode(self)

      return URLRequest(url: urlComponents.url!).with {
        $0.httpMethod = "GET"
      }
    }
  }
}

extension CharacterSet {
  func asArray() -> [Unicode.Scalar] {
    var array = [Unicode.Scalar]()
    for codePoint in (0 as UInt32) ... 0x10FFFF {
      if let scalar = Unicode.Scalar(codePoint),
         self.contains(scalar) {
        array.append(scalar)
      }
    }
    return array
  }

  func print() {
    for scalar in self.asArray() {
      Swift.print("\(scalar) (U+\(String(scalar.value, radix: 16, uppercase: true)))")
    }
  }
}
