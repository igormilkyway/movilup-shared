//

import struct Foundation.Date

public struct SignUpGoogleRequest: ServerRequest {
  public typealias Response = SignUpGoogleResponse
  public static let url = "signup-google"
  public let eventDate: Date
  
  let userIDToken: String

  public init(userIDToken: String) {
    self.eventDate = .now
    self.userIDToken = userIDToken
  }
}

public struct SignUpGoogleResponse: ServerResponse {
  let isOk: Bool
}
