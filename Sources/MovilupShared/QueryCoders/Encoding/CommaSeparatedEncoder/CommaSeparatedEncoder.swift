//

#if canImport(Combine)
import Combine
#endif

final class CommaSeparatedEncoder: TopLevelEncoder {
  var userInfo: [CodingUserInfoKey : Any] = [:]

  func encode<T>(_ value: T) throws -> String where T : Encodable {
    let encoder = _CommaSeparatedEncoder()
    encoder.userInfo = self.userInfo

    try value.encode(to: encoder)

    return encoder.container.storage
  }
}
