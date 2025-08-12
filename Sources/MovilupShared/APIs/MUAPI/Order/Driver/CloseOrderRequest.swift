//

public struct CloseOrderRequest<API: APIProtocol, Authenticator: TokenAuthenticatorProtocol>: MURequest, TokenHeaderAuthenticatedRequest {
  public typealias Success = OrderDTO

  public static var url: String { "close_order" }
  public static var roles: Set<UserRole> { [.driver, .demoDriver] }

  public init() {}
}
