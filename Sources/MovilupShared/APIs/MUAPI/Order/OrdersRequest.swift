//  Created by Igor Sorokin

public typealias OrdersResponse = [OrderDTO]

public struct OrdersRequest: MURequest, TokenAuthenticated {
  public typealias Success = OrdersResponse

  public static let url = "orders"
  public static let roles: Set<UserRole> = [.driver]

  public let state: OrderState?

  public init(state: OrderState?) {
    self.state = state
  }
}
