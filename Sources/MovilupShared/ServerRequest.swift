//

import struct Foundation.Date

public protocol ServerRequest: Codable {
  associatedtype Response: ServerResponse
  static var url: String { get }
  var eventDate: Date { get }
}

public protocol ServerResponse: Codable {

}
