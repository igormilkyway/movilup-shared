//

import Foundation

class QueryKeyedEncodingContainer<Key: CodingKey>: KeyedEncodingContainerProtocol, EncodingContainerStorable {
  var codingPath: [any CodingKey] = []

  var storage: String = ""

//  var encodedValues: [String] = []

  /// - throws: `EncodingError.invalidValue` if a null value is invalid in the current context for this format.
  func encodeNil(forKey key: Key) throws {
    fatalError()
  }

  /// Encodes the given value for the given key.
  /// - throws: `EncodingError.invalidValue` if the given value is invalid in the current context for this format.
  func encode<T>(_ value: T, forKey key: Key) throws where T : Encodable {
    let stringValue = if let value = value as? LosslessStringConvertible {
      String(value)
    } else {
      try CommaSeparatedEncoder().encode(value)
    }

//        throw EncodingError.invalidValue(value, EncodingError.Context(
//          codingPath: self.codingPath,
//          debugDescription: "Can not to encode: \(String(describing: type(of: value)))")

    guard let percentEncodedValue = stringValue.addingPercentEncoding(withAllowedCharacters: QueryEncoder.urlQueryValueAllowed) else {
      throw EncodingError.invalidValue(value, EncodingError.Context(
        codingPath: self.codingPath,
        debugDescription: "Cannot to percent encode: \(stringValue)"
      ))
    }

    if !storage.isEmpty {
      storage.append("&")
    }

    storage.append("\(key.stringValue)=\(stringValue)") // percentEncodedValue
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

class QueryUnkeyedEncodingContainer: UnkeyedEncodingContainer, EncodingContainerStorable {
  var codingPath: [any CodingKey] = []

  var count: Int = 0

  var storage: String = ""

//  var storage: [String] = []

  /// - Throws: EncodingError.invalidValue if a null value is invalid in the current context for this format.
  func encodeNil() throws {
    fatalError()
  }

  func encode<T>(contentsOf sequence: T) throws where T : Sequence, T.Element == String {
    fatalError()
  }

  /// - Throws: EncodingError.invalidValue if the given value is invalid in the current context for this format.
  func encode<T>(_ value: T) throws where T : Encodable {
    let stringValue = if let value = value as? LosslessStringConvertible {
      String(value)
    } else {
      fatalError()
    }

    if !storage.isEmpty {
      storage += ","
    }

    storage += stringValue
    count += 1
  }

  func nestedContainer<NestedKey>(keyedBy keyType: NestedKey.Type) -> KeyedEncodingContainer<NestedKey> where NestedKey : CodingKey {
    fatalError()
  }
  
  func nestedUnkeyedContainer() -> any UnkeyedEncodingContainer {
    fatalError()
  }
  
  func superEncoder() -> any Encoder {
    fatalError()
  }
}

class QuerySingleValueEncodingContainer: SingleValueEncodingContainer, EncodingContainerStorable {
  var codingPath: [any CodingKey] = []

  var storage: String = ""

  func encodeNil() throws {
    throw EncodingError.invalidValue("nil", EncodingError.Context(codingPath: codingPath, debugDescription: ""))
  }

  /// Precondition: May not be called after a previous self.encode(_:) call.
  func encode<T>(_ value: T) throws where T : Encodable {
    guard let value = value as? LosslessStringConvertible else {
      fatalError()
    }

    self.storage = String(value)
  }

//  func encode(_ value: String) throws {
//    self.storage = value
//  }
}

final class __QueryEncoder: Encoder {
  var codingPath: [any CodingKey] = []

  var userInfo: [CodingUserInfoKey : Any] = [:]

  var container: EncodingContainerStorable!

  /// Returns an encoding container appropriate for holding multiple values keyed by the given key type.
  /// Think of this as a container for collections that have keys and values, such as: classes, structures and dictionaries.
  func container<Key>(keyedBy type: Key.Type) -> KeyedEncodingContainer<Key> where Key : CodingKey {
    let container = QueryKeyedEncodingContainer<Key>()
    self.container = container
    return KeyedEncodingContainer(container)
  }

  /// Returns an encoding container appropriate for holding multiple unkeyed values.
  /// Think of this as a container for collection that don’t use keys and just hold values, such as: arrays and sets.
  func unkeyedContainer() -> any UnkeyedEncodingContainer {
    let container = QueryUnkeyedEncodingContainer()
    self.container = container
    return container
  }

  /// Returns an encoding container appropriate for holding a single primitive value.
  /// Think of this as a container that holds single primitive values, such as: integers and strings.
  func singleValueContainer() -> any SingleValueEncodingContainer {
    let container = QuerySingleValueEncodingContainer()
    self.container = container
    return container
  }
}
