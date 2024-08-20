//

import struct Foundation.Date

public struct ApproveOrderRequest: ServerRequest {
  public typealias Response = ApproveOrderResponse
  public static let url = "approve_order"

  public init() {}
}

public typealias ApproveOrderResponse = OrderDTO
