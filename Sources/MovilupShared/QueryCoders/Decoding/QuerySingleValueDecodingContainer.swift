//

final class QuerySingleValueDecodingContainer: SingleValueDecodingContainer {
  var encoded: String

  init(encoded: String) {
    self.encoded = encoded
  }

  func decode<T>(_ type: T.Type) throws -> T where T : Decodable {
    let context = DecodingError.Context(
      codingPath: self.codingPath,
      debugDescription: "Expected to decode String but found \(String(describing: type)) instead"
    )

    throw DecodingError.typeMismatch(T.self, context)
  }

  func decode(_ type: String.Type) throws -> String {
    String(self.encoded.reversed())
  }


  var codingPath: [any CodingKey] = []

  func decodeNil() -> Bool {
    false
  }
}
