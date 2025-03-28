//  Created by Igor Sorokin

public typealias OrdersResponse = [OrderDTO]

public struct OrdersRequest: TokenAuthenticatingServerRequest {
  public typealias Success = OrdersResponse

  public static let url = "orders"

  public let state: OrderState?

  public init(state: OrderState?) {
    self.state = state
  }
}
