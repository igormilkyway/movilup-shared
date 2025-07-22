//

final class CommaSeparatedSingleValueEncodingContainer: SingleValueEncodingContainer, EncodingContainerStorable {
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
