//

import struct Foundation.Date

public struct LogRequest: ServerRequest {
  public typealias Response = LogResponse
  public static let url = "log"
  public let eventDate: Date
  
  let message: String

  init(message: String) {
    self.eventDate = .now
    self.message = message
  }
}

public struct LogResponse: ServerResponse {

}
