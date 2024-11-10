//  Created by Igor Sorokin

import struct Foundation.Date

public struct SignUpGoogleRequest: AuthenticatingServerRequest {
  public typealias Response = SignUpResponse
  public static let url = "signup-google"
  public static let authentication: ServerRequestAuthentication = .token

  public init() {}
}
