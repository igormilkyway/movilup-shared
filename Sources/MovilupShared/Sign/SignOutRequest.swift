//

import struct Foundation.Date

public struct SignOutRequest: ServerRequest {
  public typealias Response = SignOutResponse
  public static let url = "sign-out"
  
  let userIDToken: String

  public init(userIDToken: String) {
    self.userIDToken = userIDToken
  }
}

public struct SignOutResponse: ServerResponse {
}
