//  Created by Igor Sorokin

import struct Foundation.Date

public struct SignInGoogleRequest: ServerRequest {
  public typealias Response = MeResponse
  public static let url = "signin-google"

  public init() {}
}
