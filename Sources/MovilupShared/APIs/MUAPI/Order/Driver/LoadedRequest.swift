//

public struct LoadedRequest<API: APIProtocol, Authenticator: TokenAuthenticatorProtocol>: MURequest, TokenHeaderAuthenticatedRequest {
  public typealias Success = OrderDTO

  public static var url: String { "loaded" }
  public static var roles: Set<UserRole> { [.driver, .demoDriver] }

  public init() {}
}
