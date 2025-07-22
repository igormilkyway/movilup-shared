//

struct QueryPartParser {
  private var value: String

  init(from value: String) {
    self.value = value
  }

  func parse() -> [String: String] {
    value
      .components(separatedBy: "&")
      .reduce(into: [String: String]()) { partialResult, keyValuePairString in
        let components = keyValuePairString.components(separatedBy: "=")
        guard components.count == 2 else { return }

        partialResult[components[0]] = components[1]
      }
  }
}

final class QueryKeyedDecodingContainer<Key: CodingKey>: KeyedDecodingContainerProtocol {
  var codingPath: [any CodingKey] = []

  var encoded: String
  var decoded: [String:String]

  var allKeys: [Key] {
    self.decoded.keys.compactMap { key in
      Key(stringValue: key)
    }
  }

  init(encoded: String) {
    self.encoded = encoded

    let parser = QueryPartParser(from: encoded)
    self.decoded = parser.parse()
  }

  /// Whether the decoder contains a value associated with the given key.
  /// The value associated with key may be a null value as appropriate for the data format.
  func contains(_ key: Key) -> Bool {
    decoded[key.stringValue] != nil
  }

  /// Decodes a value of the given type for the given key.
  /// - parameter type: The type of value to decode.
  /// - parameter key: The key that the decoded value is associated with.
  /// - returns: A value of the requested type, if present for the given key
  ///   and convertible to the requested type.
  /// - throws: `DecodingError.typeMismatch` if the encountered encoded value
  ///   is not convertible to the requested type.
  /// - throws: `DecodingError.keyNotFound` if `self` does not have an entry
  ///   for the given key.
  /// - throws: `DecodingError.valueNotFound` if `self` has a null entry for
  ///   the given key.
  func decode<T>(_ type: T.Type, forKey key: Key) throws -> T where T : Decodable {
    guard let stringValue = decoded[key.stringValue] else {
      throw DecodingError.keyNotFound(key, DecodingError.Context(
        codingPath: self.codingPath,
        debugDescription: "Cannot find key: \(key.stringValue)"
      ))
    }

    guard let stringValue = stringValue.removingPercentEncoding else {
      throw DecodingError.typeMismatch(T.self, DecodingError.Context(
        codingPath: self.codingPath,
        debugDescription: "Cannot to percent decode: \(stringValue)"
      ))
    }

    let decoded = switch type {
      case is String.Type:
        stringValue as? T
      case is Int.Type:
        Int(stringValue) as? T
      default:
        throw DecodingError.typeMismatch(T.self, DecodingError.Context(
          codingPath: self.codingPath,
          debugDescription: "Wrong type: \(String(describing: T.self))"
        ))
    }

    guard let decoded else {
      throw DecodingError.typeMismatch(T.self, DecodingError.Context(
        codingPath: self.codingPath,
        debugDescription: "Wrong type: \(String(describing: T.self))"
      ))
    }

    return decoded
  }

  func decodeNil(forKey key: Key) throws -> Bool {
    false
  }

  func nestedContainer<NestedKey>(keyedBy type: NestedKey.Type, forKey key: Key) throws -> KeyedDecodingContainer<NestedKey> where NestedKey : CodingKey {
    fatalError()
  }

  func nestedUnkeyedContainer(forKey key: Key) throws -> any UnkeyedDecodingContainer {
    fatalError()
  }

  func superDecoder(forKey key: Key) throws -> any Decoder {
    fatalError()
  }

  func superDecoder() throws -> any Decoder {
    fatalError()
  }
}
