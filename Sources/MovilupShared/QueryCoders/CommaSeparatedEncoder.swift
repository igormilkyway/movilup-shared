//

import Foundation

class CommaSeparatedKeyedEncodingContainer<Key: CodingKey>: KeyedEncodingContainerProtocol, EncodingContainerStorable {
  var codingPath: [any CodingKey] = []
  var storage: String = ""

  func encodeNil(forKey key: Key) throws {
    fatalError()
  }

  func encode<T>(_ value: T, forKey key: Key) throws where T : Encodable {
    let stringValue = if let value = value as? LosslessStringConvertible {
      String(value)
    } else {
      fatalError()
    }

    if !storage.isEmpty {
      storage.append(",")
    }

    storage.append(stringValue)
  }

  func nestedContainer<NestedKey>(keyedBy keyType: NestedKey.Type, forKey key: Key) -> KeyedEncodingContainer<NestedKey> where NestedKey : CodingKey {
    fatalError()
  }

  func nestedUnkeyedContainer(forKey key: Key) -> any UnkeyedEncodingContainer {
    fatalError()
  }

  func superEncoder(forKey key: Key) -> any Encoder {
    fatalError()
  }

  func superEncoder() -> any Encoder {
    fatalError()
  }
}

class CommaSeparatedUnkeyedEncodingContainer: UnkeyedEncodingContainer, EncodingContainerStorable {
  var codingPath: [any CodingKey] = []
  var count: Int = 0
  var storage: String = ""

  func encodeNil() throws {
    fatalError()
  }

  func encode<T>(contentsOf sequence: T) throws where T : Sequence, T.Element == String {
    fatalError()
  }

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

class CommaSeparatedSingleValueEncodingContainer: SingleValueEncodingContainer, EncodingContainerStorable {
  var codingPath: [any CodingKey] = []
  var storage: String = ""

  func encodeNil() throws {
    throw EncodingError.invalidValue("nil", EncodingError.Context(codingPath: codingPath, debugDescription: ""))
  }

  func encode<T>(_ value: T) throws where T : Encodable {
    storage = if let value = value as? LosslessStringConvertible {
      String(value)
    } else {
      fatalError()
    }
  }
}

final class __CommaSeparatedEncoder: Encoder {
  var codingPath: [any CodingKey] = []
  var userInfo: [CodingUserInfoKey : Any] = [:]
  var container: EncodingContainerStorable!

  func container<Key>(keyedBy type: Key.Type) -> KeyedEncodingContainer<Key> where Key : CodingKey {
    let container = CommaSeparatedKeyedEncodingContainer<Key>()
    self.container = container
    return KeyedEncodingContainer(container)
  }

  func unkeyedContainer() -> any UnkeyedEncodingContainer {
    let container = CommaSeparatedUnkeyedEncodingContainer()
    self.container = container
    return container
  }

  func singleValueContainer() -> any SingleValueEncodingContainer {
    let container = CommaSeparatedSingleValueEncodingContainer()
    self.container = container
    return container
  }
}
