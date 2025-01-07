//  Created by Igor Sorokin

public typealias OrdersResponse = [OrderResponse]

public struct OrdersRequest: AuthenticatingServerRequest {
  public typealias Success = OrdersResponse

  public static let url = "orders"

  public let state: OrderState?

  public init(state: OrderState?) {
    self.state = state
  }
}
