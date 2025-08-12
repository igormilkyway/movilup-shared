//  Created by Igor Sorokin

public typealias UsersResponse = [UserDTO]

public struct UsersRequest<API: APIProtocol, Authenticator: TokenAuthenticatorProtocol>: MURequest, TokenHeaderAuthenticatedRequest {
  public typealias Success = UsersResponse

  public static var url: String { "users" }
  public static var roles: Set<UserRole> { [.owner] }

  public let role: UserRole?

  public init(role: UserRole?) {
    self.role = role
  }
}
