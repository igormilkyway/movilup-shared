//  Created by Igor Sorokin

import struct Foundation.UUID

public struct UpdateOrderRequest: MURequest, TokenAuthenticated {
  public typealias Success = OrderDTO

  public static let url = "update_order"

  public let state: OrderState
  public let orderID: UUID?
  public let coordinate: Coordinate?

  public init(to state: OrderState, orderID: UUID?, coordinate: Coordinate?) {
    self.state = state
    self.orderID = orderID
    self.coordinate = coordinate
  }
}
