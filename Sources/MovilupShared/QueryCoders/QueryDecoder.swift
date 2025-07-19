//

struct MyParser {
  private var value: String

  init(from value: String) {
    self.value = value
  }

  func parse() throws -> String {
    String(value.reversed())
  }
}

struct QueryParser {
  private var value: String

  init(from value: String) {
    self.value = value
  }

  func parse() -> [String] {
    self.value
      .components(separatedBy: ",")
      .map {
        String($0.reversed())
      }
  }
}

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

/// A type that provides a view into a decoder’s storage and is used to hold the encoded properties of a decodable type in a keyed manner.
class QueryKeyedDecodingContainer<Key: CodingKey>: KeyedDecodingContainerProtocol {
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

class QueryUnkeyedDecodingContainer: UnkeyedDecodingContainer {
  var encoded: String
  var decoded: [String] = []

  init(encoded: String) {
    self.encoded = encoded

    let parser = QueryParser(from: encoded)
    self.decoded = parser.parse()
  }

  var codingPath: [any CodingKey] = []

  /// The number of elements contained within this container.
  /// If the number of elements is unknown, the value is nil.
  var count: Int? { decoded.count }

  /// Whether there are no more elements left to be decoded in the container.
  var isAtEnd: Bool {
    currentIndex >= decoded.count
  }

  /// The current decoding index of the container (i.e. the index of the next element to be decoded.) Incremented after every successful decode call.
  var currentIndex: Int = 0

  /// - returns: Whether the encountered value was null.
  /// If the value is not null, does not increment currentIndex.
  /// - throws: `DecodingError.valueNotFound` if there are no more values to decode.
  func decodeNil() throws -> Bool {
    false
  }

  /// - returns: A value of the requested type, if present for the given key and convertible to the requested type.
  /// - throws:
  ///   - `DecodingError.typeMismatch` if the encountered encoded value is not convertible to the requested type.
  ///   - `DecodingError.valueNotFound` if the encountered encoded value is null, or of there are no more values to decode.
  func decode<T>(_ type: T.Type) throws -> T where T : Decodable {
    let decodedValue = decoded[currentIndex]
    defer { currentIndex += 1 }

    guard let decodedValue = decodedValue as? T else {
      let context = DecodingError.Context(
        codingPath: self.codingPath,
        debugDescription: "Expected to decode String but found \(String(describing: type)) instead"
      )
      throw DecodingError.typeMismatch(T.self, context)
    }

    return decodedValue
  }

  func decode(_ type: String.Type) throws -> String {
    let result = "Test \(currentIndex)"
    currentIndex += 1
    return result
  }

  func nestedContainer<NestedKey>(keyedBy type: NestedKey.Type) throws -> KeyedDecodingContainer<NestedKey> where NestedKey : CodingKey {
    fatalError()
  }
  
  func nestedUnkeyedContainer() throws -> any UnkeyedDecodingContainer {
    fatalError()
  }
  
  func superDecoder() throws -> any Decoder {
    fatalError()
  }
}

class QuerySingleValueDecodingContainer: SingleValueDecodingContainer {
  var encoded: String

  init(encoded: String) {
    self.encoded = encoded
  }

  func decode<T>(_ type: T.Type) throws -> T where T : Decodable {
    let context = DecodingError.Context(
      codingPath: self.codingPath,
      debugDescription: "Expected to decode String but found \(String(describing: type)) instead"
    )

    throw DecodingError.typeMismatch(T.self, context)
  }

  func decode(_ type: String.Type) throws -> String {
    String(self.encoded.reversed())
  }


  var codingPath: [any CodingKey] = []

  func decodeNil() -> Bool {
    false
  }
}

class __QueryDecoder: Decoder {
  var codingPath: [any CodingKey] = []
  var userInfo: [CodingUserInfoKey : Any] = [:]

  var encoded: String

  init(encoded: String) {
    self.encoded = encoded
  }

  func container<Key>(keyedBy type: Key.Type) throws -> KeyedDecodingContainer<Key> where Key : CodingKey {
    let container = QueryKeyedDecodingContainer<Key>(encoded: encoded)
    return KeyedDecodingContainer(container)
  }

//  var container: QueryUnkeyedDecodingContainer?

  func unkeyedContainer() throws -> any UnkeyedDecodingContainer {
    let container = QueryUnkeyedDecodingContainer(encoded: encoded)
//    self.container = container
    return container
  }

//  var container: QuerySingleValueDecodingContainer?

  func singleValueContainer() throws -> any SingleValueDecodingContainer {
    let container = QuerySingleValueDecodingContainer(encoded: encoded)
//    self.container = container
    return container
  }
}
