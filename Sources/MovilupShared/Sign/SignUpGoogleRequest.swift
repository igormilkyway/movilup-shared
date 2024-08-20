//

import struct Foundation.Date

public struct SignUpGoogleRequest: ServerRequest {
  public typealias Response = SignUpResponse
  public static let url = "signup-google"

  public init() {}
}
