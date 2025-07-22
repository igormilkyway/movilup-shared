//

class QueryValueSingleValueEncodingContainer: SingleValueEncodingContainer, EncodingContainerStorable {
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
