//

import struct Foundation.Date

public struct SignInRequest: ServerRequest {
  public typealias Response = MeResponse
  public static let url = "signin"

  public init() {}
}
