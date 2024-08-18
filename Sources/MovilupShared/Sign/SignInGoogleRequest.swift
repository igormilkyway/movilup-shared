//

import struct Foundation.Date

public struct SignInGoogleRequest: ServerRequest {
  public typealias Response = SignInResponse
  public static let url = "signin-google"
  public let eventDate: Date

  public init() {
    self.eventDate = .now
  }
}
