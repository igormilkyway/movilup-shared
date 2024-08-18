//

import struct Foundation.Date

struct LogRequest: ServerRequest {
  typealias Response = LogResponse
  static let url = "log"
  let eventDate: Date
  
  let message: String

  init(message: String) {
    self.eventDate = .now
    self.message = message
  }
}

struct LogResponse: ServerResponse {

}
