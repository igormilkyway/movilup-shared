//

import struct Foundation.Date

public struct SignInRequest: ServerRequest {
  public typealias Response = SignInResponse
  public static let url = "signin"

  public init() {}
}
