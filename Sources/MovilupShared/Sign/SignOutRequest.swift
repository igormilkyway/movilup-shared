//

import struct Foundation.Date

public struct SignOutRequest: ServerRequest {
  public typealias Response = EmptyServerResponse
  public static let url = "sign-out"

  public init() {}
}
