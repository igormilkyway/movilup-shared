//

final class _QueryValueEncoder: Encoder {
  var codingPath: [any CodingKey] = []

  var userInfo: [CodingUserInfoKey : Any] = [:]

  var container: EncodingContainerStorable!

  /// Returns an encoding container appropriate for holding multiple values keyed by the given key type.
  /// Think of this as a container for collections that have keys and values, such as: classes, structures and dictionaries.
  func container<Key>(keyedBy type: Key.Type) -> KeyedEncodingContainer<Key> where Key : CodingKey {
    let container = QueryValueKeyedEncodingContainer<Key>()
    self.container = container
    return KeyedEncodingContainer(container)
  }

  /// Returns an encoding container appropriate for holding multiple unkeyed values.
  /// Think of this as a container for collection that don’t use keys and just hold values, such as: arrays and sets.
  func unkeyedContainer() -> any UnkeyedEncodingContainer {
    let container = QueryValueUnkeyedEncodingContainer()
    self.container = container
    return container
  }

  /// Returns an encoding container appropriate for holding a single primitive value.
  /// Think of this as a container that holds single primitive values, such as: integers and strings.
  func singleValueContainer() -> any SingleValueEncodingContainer {
    let container = QueryValueSingleValueEncodingContainer()
    self.container = container
    return container
  }
}
