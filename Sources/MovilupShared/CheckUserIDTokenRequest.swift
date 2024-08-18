//

import struct Foundation.Date

struct CheckUserIDTokenRequest: ServerRequest {
  typealias Response = CheckUserIDTokenResponse
  static let url = "check-userid-token"
  let eventDate: Date
  
  let userIDToken: String

  init(userIDToken: String) {
    self.eventDate = .now
    self.userIDToken = userIDToken
  }
}

struct CheckUserIDTokenResponse: ServerResponse {
  let isOk: Bool
}
