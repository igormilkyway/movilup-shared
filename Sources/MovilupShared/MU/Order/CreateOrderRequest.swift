//  Created by Igor Sorokin

public struct CreateOrderRequest: MURequest, TokenAuthenticated {
  public typealias Success = OrderDTO
  public typealias Failure = MeError

  public static let url = "create_order"
  public static let roles: [UserRole] = [.customer]

  public let order: OrderDTO

  public init(order: OrderDTO) {
    self.order = order
  }
}
