//

final class QueryValueKeyedEncodingContainer<Key: CodingKey>: KeyedEncodingContainerProtocol, EncodingContainerStorable {
  var codingPath: [any CodingKey] = []

  private var _storage: Dictionary<Int, String> = [:]
  private var separator = ","

  var storage: String {
    _storage.keys.sorted()
      .map {
        _storage[$0]!
      }
      .joined(separator: separator)
  }

  //  var encodedValues: [String] = []

  /// - throws: `EncodingError.invalidValue` if a null value is invalid in the current context for this format.
  func encodeNil(forKey key: Key) throws {
    fatalError()
  }

  func encodeIfPresent(_ value: Double?, forKey key: Key) throws {
    fatalError()
  }

//  func encode<T>(_ value: T, forKey key: Key) throws where T: Encodable, T == AsUnkeyed<Double> {
//    print(value.wrappedValue)
//  }

  /// Encodes the given value for the given key.
  /// - throws: `EncodingError.invalidValue` if the given value is invalid in the current context for this format.
  func encode<T>(_ value: T, forKey key: Key) throws where T : Encodable {
    if let unkeyedValue = value as? AsUnkeyed<Double> {
      separator = unkeyedValue.projectedValue.separator
      _storage[unkeyedValue.projectedValue.order] = try QueryValueEncoder().encode(unkeyedValue.wrappedValue)
    } else {
      let (stringValue, _) = if let value = value as? LosslessStringConvertible {
        (String(value), ",")
      } else {
        (try QueryValueEncoder().encode(value), ";")
      }

      _storage[(_storage.keys.max() ?? -1) + 1] = stringValue
    }

    //        throw EncodingError.invalidValue(value, EncodingError.Context(
    //          codingPath: self.codingPath,
    //          debugDescription: "Can not to encode: \(String(describing: type(of: value)))")

//    guard let percentEncodedValue = stringValue.addingPercentEncoding(withAllowedCharacters: QueryEncoder.urlQueryValueAllowed) else {
//      throw EncodingError.invalidValue(value, EncodingError.Context(
//        codingPath: self.codingPath,
//        debugDescription: "Cannot to percent encode: \(stringValue)"
//      ))
//    }
  }

  //  func encode(_ value: String, forKey key: Key) throws {
  //    let encodedValue = [key.stringValue, value].joined(separator: "=")
  //    self.encodedValues.append(encodedValue)
  //  }
  //
  //  func encode(_ value: Int, forKey key: Key) throws {
  //    try self.encode("\(value)", forKey: key)
  //  }

  /// Stores a keyed encoding container for the given key and returns it.
  func nestedContainer<NestedKey>(keyedBy keyType: NestedKey.Type, forKey key: Key) -> KeyedEncodingContainer<NestedKey> where NestedKey : CodingKey {
    fatalError()
  }

  /// Stores an unkeyed encoding container for the given key and returns it.
  func nestedUnkeyedContainer(forKey key: Key) -> any UnkeyedEncodingContainer {
    fatalError()
  }

  /// Stores a new nested container for the given key and returns a new encoder instance for encoding super into that container.
  /// - Parameters:
  ///   - key: The key to encode super for.
  /// - returns: A new encoder to pass to super.encode(to:).
  func superEncoder(forKey key: Key) -> any Encoder {
    fatalError()
  }

  /// Stores a new nested container for the default `super` key and returns a new encoder instance for encoding `super` into that container.
  /// Equivalent to calling `superEncoder(forKey:)` with `Key(stringValue: "super", intValue: 0)`.
  func superEncoder() -> any Encoder {
    fatalError()
  }
}
