//

import Foundation

#if canImport(Combine)
import Combine
#endif

public final class QueryValueEncoder: TopLevelEncoder {
  public init() {

  }

  public var userInfo: [CodingUserInfoKey : Any] = [:]

  public func encode<T>(_ value: T) throws -> String where T : Encodable {
    let encoder = _QueryValueEncoder()
    encoder.userInfo = self.userInfo

    try value.encode(to: encoder)

    return encoder.container.storage // Data(encoder.container.storage.utf8)
  }
}
