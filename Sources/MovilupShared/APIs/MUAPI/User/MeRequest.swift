//  Created by Igor Sorokin

public struct MeRequest<API: APIProtocol, Authenticator: TokenAuthenticatorProtocol>: MURequest, TokenHeaderAuthenticatedRequest {
  public typealias Success = MeResponse

  public static var url: String { "me" }
  public static var roles: Set<UserRole> { .all }

  public init() {}
}

public struct MeResponse: ServerResponse {
  public let token: String
  public let user: UserDTO

  public init(token: String, user: UserDTO) {
    self.token = token
    self.user = user
  }
}
