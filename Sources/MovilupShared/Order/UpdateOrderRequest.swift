//  Created by Igor Sorokin

import struct Foundation.UUID

public struct UpdateOrderRequest: TokenAuthenticatingServerRequest {
  public typealias Success = OrderResponse

  public static let url = "update_order"

  public let state: OrderState
  public let orderID: UUID?
  public let location: LocationDTO?

  public init(to state: OrderState, orderID: UUID? = nil, location: LocationDTO? = nil) {
    self.state = state
    self.orderID = orderID
    self.location = location
  }
}
