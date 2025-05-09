//

import Foundation
import Combine

extension CodingUserInfoKey {
  static var capitalizeName: CodingUserInfoKey = CodingUserInfoKey(rawValue: "capitalizeName")!
}

protocol EncodingContainerStorable {
  var storage: String { get }
}

final class CommaSeparatedEncoder: TopLevelEncoder {
  var userInfo: [CodingUserInfoKey : Any] = [:]

  func encode<T>(_ value: T) throws -> String where T : Encodable {
    let encoder = __CommaSeparatedEncoder()
    encoder.userInfo = self.userInfo

    try value.encode(to: encoder)

    return encoder.container.storage
  }
}

final class QueryEncoder: TopLevelEncoder {
  static let urlQueryValueAllowed = {
    let urlQueryValueDisallowed = CharacterSet([
      " ",
      ":",
      "/",
      "?",
      "#",
      "[",
      "]",
      "@",
      "!",
      "$",
      "&",
      "'",
      "(",
      ")",
      "*",
      "+",
      ",",
      ";",
      "=",
      "%",
    ])

    let urlQueryValueAllowed = CharacterSet.urlQueryAllowed.subtracting(urlQueryValueDisallowed)

    //    urlQueryValueAllowed.print()

    return urlQueryValueAllowed
  }()

  var userInfo: [CodingUserInfoKey : Any] = [:]

  func encode<T>(_ value: T) throws -> String where T : Encodable {
    let encoder = __QueryEncoder()
    encoder.userInfo = self.userInfo

    try value.encode(to: encoder)

    return encoder.container.storage
  }
}

class QueryDecoder: TopLevelDecoder {
  func decode<T>(_ type: T.Type, from encoded: String) throws -> T where T : Decodable {
    let decoder = __QueryDecoder(encoded: encoded)

    return try T.init(from: decoder)
  }
}
