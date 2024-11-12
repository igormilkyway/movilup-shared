//  Created by Igor Sorokin

import struct Foundation.Date

public struct SignInGoogleRequest: GoogleAuthenticatingServerRequest {
  public typealias Response = MeResponse
  public static let url = "signin-google"

  public let token: String

  public init(token: String) {
    self.token = token
  }
}
