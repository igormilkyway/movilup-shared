//

import struct Foundation.Date

public struct SignUpRequest: ServerRequest {
  public typealias Response = SignUpResponse
  public static let url = "sign-up"
  public let eventDate: Date

  let userName: String
  let password: String

  init(userName: String, password: String) {
    self.eventDate = .now
    self.userName = userName
    self.password = password
  }
}

public struct SignUpResponse: ServerResponse {
  let token: String
}
