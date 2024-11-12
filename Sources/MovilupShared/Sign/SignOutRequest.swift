//  Created by Igor Sorokin

import struct Foundation.Date

public struct SignOutRequest: AuthenticatingServerRequest {
  public typealias Response = EmptyServerResponse
  public static let url = "sign-out"
  public static let authentication: ServerRequestAuthentication = .token

  public init() {}
}
