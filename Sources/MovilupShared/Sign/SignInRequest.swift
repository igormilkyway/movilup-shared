//

import struct Foundation.Date

public struct SignInRequest: ServerRequest {
  public typealias Response = SignInResponse
  public static let url = "signin"
  public let eventDate: Date

  let email: String
  let password: String

  public init(email: String, password: String) {
    self.eventDate = .now
    self.email = email
    self.password = password
  }
}

public struct SignInResponse: ServerResponse {
  public let token: String
}
