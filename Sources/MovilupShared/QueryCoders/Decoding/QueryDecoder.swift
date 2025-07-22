//

import Foundation

#if canImport(Combine)
import Combine
#endif

class QueryDecoder: TopLevelDecoder {
  func decode<T>(_ type: T.Type, from encoded: String) throws -> T where T : Decodable {
    let decoder = _QueryDecoder(encoded: encoded)

    return try T.init(from: decoder)
  }
}

extension QueryEncoder: With {}
