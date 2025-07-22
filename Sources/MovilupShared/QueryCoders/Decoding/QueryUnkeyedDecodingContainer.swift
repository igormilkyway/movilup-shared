//

//struct MyParser {
//  private var value: String
//
//  init(from value: String) {
//    self.value = value
//  }
//
//  func parse() throws -> String {
//    String(value.reversed())
//  }
//}

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

/// A type that provides a view into a decoder’s storage and is used to hold the encoded properties of a decodable type in a keyed manner.
final class QueryUnkeyedDecodingContainer: UnkeyedDecodingContainer {
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
