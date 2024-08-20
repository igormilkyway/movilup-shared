//

import struct Foundation.Date

public struct EstimatedOrdersRequest: ServerRequest {
  public typealias Response = OrdersResponse
  public static let url = "estimated-orders"

  public let eventDate: Date

  public init() {
    self.eventDate = .now
  }
}
