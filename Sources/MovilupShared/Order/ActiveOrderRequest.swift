//

import struct Foundation.Date

public struct ActiveOrderRequest: ServerRequest {
  public typealias Response = OrdersResponse
  public static let url = "active_order"

  public let eventDate: Date

  public init() {
    self.eventDate = .now
  }
}
