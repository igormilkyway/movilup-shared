//  Created by Igor Sorokin

import struct Foundation.Date

public struct SignInGoogleRequest: AuthenticatingServerRequest {
  public typealias Response = MeResponse
  public static let url = "signin-google"
  public static let authentication: ServerRequestAuthentication = .token

  public init() {}
}
