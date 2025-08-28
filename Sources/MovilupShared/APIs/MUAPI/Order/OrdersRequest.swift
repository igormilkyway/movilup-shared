//  Created by Igor Sorokin

public typealias OrdersResponse = [OrderDTO]

public struct OrdersRequest<API: APIProtocol, Authenticator: TokenAuthenticatorProtocol>: MURequest, TokenHeaderAuthenticatedRequest {
  public typealias Success = OrdersResponse

  public static var url: String { "orders" }
  public static var roles: Set<UserRole> { [.customer, .demoCustomer, .estimator, .driver, .owner] }

  public let state: OrderState?

  public init(state: OrderState?) {
    self.state = state
  }
}
