//

final class QueryValueUnkeyedEncodingContainer: UnkeyedEncodingContainer, EncodingContainerStorable {
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
    let (stringValue, separator) = if let value = value as? LosslessStringConvertible {
      (String(value), ",")
    } else {
      (try QueryValueEncoder().encode(value), ";")
    }

    if !storage.isEmpty {
      storage += separator
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
