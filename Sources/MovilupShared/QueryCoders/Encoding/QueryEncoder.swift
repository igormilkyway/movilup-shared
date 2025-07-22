//

import Foundation

#if canImport(Combine)
import Combine
#endif

public extension CodingUserInfoKey {
  static let capitalizeName: CodingUserInfoKey = CodingUserInfoKey(rawValue: "capitalizeName")!
}

protocol EncodingContainerStorable {
  var storage: String { get }
}

public final class QueryEncoder: TopLevelEncoder {
  public init() {

  }

  public static let urlQueryValueAllowed = {
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

  public var userInfo: [CodingUserInfoKey : Any] = [:]

  public func encode<T>(_ value: T) throws -> String where T : Encodable {
    let encoder = _QueryEncoder()
    encoder.userInfo = self.userInfo

    try value.encode(to: encoder)

    return encoder.container.storage // Data(encoder.container.storage.utf8)
  }
}
