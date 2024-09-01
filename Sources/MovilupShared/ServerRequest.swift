//

import struct Foundation.Date

public protocol ServerRequest: Codable, Sendable {
  associatedtype Response: ServerResponse
  static var url: String { get }
}

public protocol ServerResponse: Codable {}

extension Array: ServerResponse where Element: Codable {}

public struct EmptyServerResponse: ServerResponse {
  public init() {}
}
