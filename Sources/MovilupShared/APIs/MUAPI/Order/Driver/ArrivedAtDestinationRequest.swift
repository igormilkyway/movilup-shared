//

public struct ArrivedAtDestinationRequest<API: APIProtocol, Authenticator: TokenAuthenticatorProtocol>: MURequest, TokenHeaderAuthenticatedRequest {
  public typealias Success = OrderDTO

  public static var url: String { "arrived_at_destination" }
  public static var roles: Set<UserRole> { [.driver, .demoDriver] }

  public init() {}
}
