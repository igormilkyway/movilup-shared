//

import struct Foundation.Date

public struct CreateOrderRequest: ServerRequest {
  public typealias Response = CreateOrderResponse
  public static let url = "create_order"

  public let order: OrderDTO

  public init(order: OrderDTO) {
    self.order = order
  }
}

public typealias CreateOrderResponse = OrderDTO
