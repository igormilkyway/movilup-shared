//

class _QueryDecoder: Decoder {
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
