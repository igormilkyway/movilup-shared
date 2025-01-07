//  Created by Igor Sorokin

public struct CreateOrderRequest: AuthenticatingServerRequest {
  public typealias Success = OrderResponse
  public typealias Failure = MeError

  public static let url = "create_order"
  public static let roles: [UserRole] = [.customer]

  public let order: OrderResponse

  public init(order: OrderResponse) {
    self.order = order
  }
}
