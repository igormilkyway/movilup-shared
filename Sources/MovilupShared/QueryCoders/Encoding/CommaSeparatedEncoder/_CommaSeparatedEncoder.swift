//

final class _CommaSeparatedEncoder: Encoder {
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
