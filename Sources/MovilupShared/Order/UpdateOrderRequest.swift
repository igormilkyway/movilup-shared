//  Created by Igor Sorokin

import struct Foundation.UUID

public struct UpdateOrderRequest: TokenAuthenticatingServerRequest {
  public typealias Success = OrderDTO

  public static let url = "update_order"

  public let state: OrderState
  public let orderID: UUID?
  public let coordinate: CoordinateDTO?

  public init(to state: OrderState, orderID: UUID?, coordinate: CoordinateDTO?) {
    self.state = state
    self.orderID = orderID
    self.coordinate = coordinate
  }
}
