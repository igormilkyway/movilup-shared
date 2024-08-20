//

public typealias OrdersResponse = [OrderDTO]

public struct OrdersRequest: ServerRequest {
  public typealias Response = OrdersResponse
  public static let url = "orders"

  public let state: OrderState?

  public init(_ state: OrderState?) {
    self.state = state
  }
}
