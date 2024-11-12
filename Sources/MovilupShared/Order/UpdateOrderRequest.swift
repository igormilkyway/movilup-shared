//  Created by Igor Sorokin

import struct Foundation.UUID

public struct UpdateOrderRequest: AuthenticatingServerRequest {
  public typealias Response = OrderResponse
  public static let url = "update_order"
  public static let authentication: ServerRequestAuthentication = .token

  public let state: OrderState
  public let orderID: UUID?

  public init(to state: OrderState, orderID: UUID? = nil) {
    self.state = state
    self.orderID = orderID
  }
}
