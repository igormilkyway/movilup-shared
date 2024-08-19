//

import struct Foundation.Date

public struct MeRequest: ServerRequest {
  public typealias Response = MeResponse
  public static let url = "me"

  public let eventDate: Date

  public init() {
    self.eventDate = .now
  }
}
