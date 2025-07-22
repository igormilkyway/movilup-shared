//

final class CommaSeparatedUnkeyedEncodingContainer: UnkeyedEncodingContainer, EncodingContainerStorable {
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
