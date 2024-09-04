//

import Foundation

public typealias OrdersResponse = [OrdersResponseElement]

public struct OrdersRequest: ServerRequest {
  public typealias Response = OrdersResponse
  public static let url = "orders"

  public let state: OrderState?

  public init(state: OrderState?) {
    self.state = state
  }
}
