//  Created by Igor Sorokin

public struct SignOutRequest<API: APIProtocol, Authenticator: TokenAuthenticatorProtocol>: MURequest, TokenHeaderAuthenticatedRequest {  
  public static var url: String { "sign-out" }
  public static var roles: Set<UserRole> { .all }

  public init() {}
}
