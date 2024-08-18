//

import struct Foundation.Date

public struct SignUpRequest: ServerRequest {
  public typealias Response = SignUpResponse
  public static let url = "signup"
  public let eventDate: Date

  let email: String
  let password: String
  let firstName: String
  let lastName: String
  let phoneNumber: String

  public init(email: String,
              password: String,
              firstName: String,
              lastName: String = "",
              phoneNumber: String = "") {
    self.eventDate = .now

    self.email = email
    self.password = password
    self.firstName = firstName
    self.lastName = lastName
    self.phoneNumber = phoneNumber
  }
}

public struct SignUpResponse: ServerResponse {
  public let token: String
}
