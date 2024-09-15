//  Created by Igor Sorokin

import struct Foundation.UUID

public struct UpdateOrderRequest: ServerRequest {
  public typealias Response = OrderResponse
  public static let url = "update_order"

  public let state: OrderState
  public let orderID: UUID?

  public init(to state: OrderState, orderID: UUID? = nil) {
    self.state = state
    self.orderID = orderID
  }
}
