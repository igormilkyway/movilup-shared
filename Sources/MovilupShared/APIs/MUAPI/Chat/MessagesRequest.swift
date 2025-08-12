//  Created by Igor Sorokin

public struct MessagesRequest<API: APIProtocol, Authenticator: TokenAuthenticatorProtocol>: MURequest, TokenHeaderAuthenticatedRequest {
  public typealias Success = [MessageDTO]
  
  public static var url: String { "messages" }
  public static var roles: Set<UserRole> { .all }

  public init() { }
}
