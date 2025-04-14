//  Created by Igor Sorokin

import struct Foundation.UUID

public struct UpdateOrderRequest: TokenAuthenticatingServerRequest {
  public typealias Success = OrderDTO

  public static let url = "update_order"

  public let state: OrderState
  public let orderID: UUID?
  public let location: LocationDTO?

  public init(to state: OrderState, orderID: UUID?, location: LocationDTO?) {
    self.state = state
    self.orderID = orderID
    self.location = location
  }
}
