//

import struct Foundation.Date

struct SignOutRequest: ServerRequest {
  typealias Response = SignOutResponse
  static let url = "sign-out"
  let eventDate: Date
  
  let userIDToken: String

  init(userIDToken: String) {
    self.eventDate = .now
    self.userIDToken = userIDToken
  }
}

struct SignOutResponse: ServerResponse {
}
