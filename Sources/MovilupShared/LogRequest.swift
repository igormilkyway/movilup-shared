//  Created by Igor Sorokin

public struct LogRequest<API: APIProtocol, Authenticator: TokenAuthenticatorProtocol>: MURequest, TokenHeaderAuthenticatedRequest {
  public typealias Success = LogResponse

  public static var url: String { "log" }
  public static var roles: Set<UserRole> { .all }

  let message: String

  public init(message: String) {
    self.message = message
  }
}

public struct LogResponse: ServerResponse {

}
