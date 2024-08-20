//

import struct Foundation.Date

public struct OrdersRequest: ServerRequest {
  public typealias Response = OrdersResponse
  public static let url = "orders"

  public let eventDate: Date

  public init() {
    self.eventDate = .now
  }
}
