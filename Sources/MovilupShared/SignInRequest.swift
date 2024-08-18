//

import struct Foundation.Date

struct SignInRequest: ServerRequest {
  typealias Response = SignInResponse
  static let url = "sign-in"
  let eventDate: Date

  let userName: String
  let password: String

  init(userName: String, password: String) {
    self.eventDate = .now
    self.userName = userName
    self.password = password
  }
}

struct SignInResponse: ServerResponse {
  let token: String
}
