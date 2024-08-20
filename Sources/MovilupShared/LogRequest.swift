//

import struct Foundation.Date

public struct LogRequest: ServerRequest {
  public typealias Response = LogResponse
  public static let url = "log"

  let message: String

  public init(message: String) {
    self.message = message
  }
}

public struct LogResponse: ServerResponse {

}
