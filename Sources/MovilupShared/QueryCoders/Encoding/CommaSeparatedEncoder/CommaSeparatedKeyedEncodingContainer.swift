//

final class CommaSeparatedKeyedEncodingContainer<Key: CodingKey>: KeyedEncodingContainerProtocol, EncodingContainerStorable {
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
