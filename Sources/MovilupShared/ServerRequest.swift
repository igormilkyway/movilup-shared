//

import struct Foundation.Date

protocol ServerRequest: Codable {
  associatedtype Response: ServerResponse
  static var url: String { get }
  var eventDate: Date { get }
}

protocol ServerResponse: Codable {

}
