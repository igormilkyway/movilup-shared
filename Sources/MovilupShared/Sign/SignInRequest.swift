//

import struct Foundation.Date

public struct SignInRequest: ServerRequest {
  public typealias Response = SignInResponse
  public static let url = "signin"
  public let eventDate: Date

  public init() {
    self.eventDate = .now
  }
}
