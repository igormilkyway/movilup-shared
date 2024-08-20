//

import struct Foundation.Date

public struct CreatedOrdersRequest: ServerRequest {
  public typealias Response = OrdersResponse
  public static let url = "created-orders"

  public init() {}
}
