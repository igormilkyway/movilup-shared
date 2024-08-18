//

import struct Foundation.Date

public struct SignOutRequest: ServerRequest {
  public typealias Response = SignOutResponse
  public static let url = "sign-out"
  public let eventDate: Date
  
  let userIDToken: String

  init(userIDToken: String) {
    self.eventDate = .now
    self.userIDToken = userIDToken
  }
}

public struct SignOutResponse: ServerResponse {
}
