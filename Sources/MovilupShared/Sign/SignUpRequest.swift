//

import struct Foundation.Date
import struct Foundation.URL

public struct SignUpRequest: ServerRequest {  
  public typealias Response = SignUpResponse
  public static let url = "signup"

  public let email: String
  public let password: String
  public let firstName: String
  public let lastName: String?
  public let phoneNumber: String?

  public init(email: String,
              password: String,
              firstName: String,
              lastName: String?,
              phoneNumber: String?) {
    self.email = email
    self.password = password
    self.firstName = firstName
    self.lastName = lastName
    self.phoneNumber = phoneNumber
  }
}
