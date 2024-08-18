//

import struct Foundation.Date

public struct SignInGoogleRequest: ServerRequest {
  public typealias Response = SignInGoogleResponse
  public static let url = "signin-google"
  public let eventDate: Date
  
  let userIDToken: String

  public init(userIDToken: String) {
    self.eventDate = .now
    self.userIDToken = userIDToken
  }
}

public struct SignInGoogleResponse: ServerResponse {
  let isOk: Bool
}
