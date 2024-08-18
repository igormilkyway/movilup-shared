//

import struct Foundation.Date

public struct EmailVerificationRequest: ServerRequest {
  public typealias Response = SignUpResponse
  public static let url = "email-verification"

  public let eventDate: Date

  public let email: String
  public let code: String

  public init(email: String,
              code: String) {
    self.eventDate = .now

    self.email = email
    self.code = code
  }
}
