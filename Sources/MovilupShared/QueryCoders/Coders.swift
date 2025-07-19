//

import Foundation

#if canImport(Combine)
import Combine
#else
/// A type that defines methods for encoding.
@available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
public protocol TopLevelEncoder {

  /// The type this encoder produces.
  associatedtype Output

  /// Encodes an instance of the indicated type.
  ///
  /// - Parameter value: The instance to encode.
  func encode<T>(_ value: T) throws -> Self.Output where T : Encodable
}

/// A type that defines methods for decoding.
@available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
public protocol TopLevelDecoder {

  /// The type this decoder accepts.
  associatedtype Input

  /// Decodes an instance of the indicated type.
  func decode<T>(_ type: T.Type, from: Self.Input) throws -> T where T : Decodable
}
#endif

extension CodingUserInfoKey {
  static let capitalizeName: CodingUserInfoKey = CodingUserInfoKey(rawValue: "capitalizeName")!
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

  public func encode<T>(_ value: T) throws -> Data where T : Encodable {
    let encoder = __QueryEncoder()
    encoder.userInfo = self.userInfo

    try value.encode(to: encoder)

    return Data(encoder.container.storage.utf8)
  }
}

class QueryDecoder: TopLevelDecoder {
  func decode<T>(_ type: T.Type, from encoded: String) throws -> T where T : Decodable {
    let decoder = __QueryDecoder(encoded: encoded)

    return try T.init(from: decoder)
  }
}

extension QueryEncoder: With {}
