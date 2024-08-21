//

import struct Foundation.UUID

public typealias CreateOrderRequest = OrderDTO
public typealias CreateOrderResponse = OrderDTO

public struct UpdateOrderRequest: ServerRequest {
  public typealias Response = UpdateOrderResponse
  public static let url = "update_order"

  public let state: OrderState
  public let orderID: UUID?

  public init(to state: OrderState, orderID: UUID? = nil) {
    self.state = state
    self.orderID = orderID
  }}

public typealias UpdateOrderResponse = OrderDTO
