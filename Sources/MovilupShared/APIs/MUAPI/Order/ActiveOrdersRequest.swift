//  Created by Igor Sorokin

public struct ActiveOrderRequest<API: APIProtocol, Authenticator: TokenAuthenticatorProtocol>: MURequest, TokenHeaderAuthenticatedRequest {
  public typealias Success = OrderDTO?

  public static var url: String { "active_order" }
  public static var roles: Set<UserRole> { [.customer, .demoCustomer, .driver, .estimator] }

  public init() {}
}
