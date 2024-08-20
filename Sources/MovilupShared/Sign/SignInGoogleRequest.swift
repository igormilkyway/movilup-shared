//

import struct Foundation.Date

public struct SignInGoogleRequest: ServerRequest {
  public typealias Response = SignInResponse
  public static let url = "signin-google"

  public init() {}
}
