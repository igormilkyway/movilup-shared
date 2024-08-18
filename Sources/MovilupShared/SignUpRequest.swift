//

import struct Foundation.Date

struct SignUpRequest: ServerRequest {
  typealias Response = SignUpResponse
  static let url = "sign-up"
  let eventDate: Date

  let userName: String
  let password: String

  init(userName: String, password: String) {
    self.eventDate = .now
    self.userName = userName
    self.password = password
  }
}

struct SignUpResponse: ServerResponse {
  let token: String
}
