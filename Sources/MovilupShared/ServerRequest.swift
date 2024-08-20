//

import struct Foundation.Date

public protocol ServerRequest: Codable {
  associatedtype Response: ServerResponse
  static var url: String { get }
}

public protocol ServerResponse: Codable {}

extension Array: ServerResponse where Element: Codable {}
