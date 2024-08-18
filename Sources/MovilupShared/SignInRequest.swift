//

import struct Foundation.Date

public struct SignInRequest: ServerRequest {
  public typealias Response = SignInResponse
  public static let url = "sign-in"
  public let eventDate: Date

  let userName: String
  let password: String

  init(userName: String, password: String) {
    self.eventDate = .now
    self.userName = userName
    self.password = password
  }
}

public struct SignInResponse: ServerResponse {
  let token: String
}
