//

import struct Foundation.Date

public struct CreatedOrdersRequest: ServerRequest {
  public typealias Response = OrdersResponse
  public static let url = "created-orders"

  public let eventDate: Date

  public init() {
    self.eventDate = .now
  }
}
