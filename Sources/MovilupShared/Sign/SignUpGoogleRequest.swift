//  Created by Igor Sorokin

import struct Foundation.Date

public struct SignUpGoogleRequest: GoogleAuthenticatingServerRequest {
  public typealias Response = SignUpResponse
  public static let url = "signup-google"

  public let token: String

  public init(token: String) {
    self.token = token
  }
}
