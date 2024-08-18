//

import struct Foundation.Date

public struct CheckUserIDTokenRequest: ServerRequest {
  public typealias Response = CheckUserIDTokenResponse
  public static let url = "check-userid-token"
  public let eventDate: Date
  
  let userIDToken: String

  init(userIDToken: String) {
    self.eventDate = .now
    self.userIDToken = userIDToken
  }
}

public struct CheckUserIDTokenResponse: ServerResponse {
  let isOk: Bool
}
