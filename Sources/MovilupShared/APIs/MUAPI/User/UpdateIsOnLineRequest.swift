//  Created by Igor Sorokin

public struct UpdateIsOnLineRequest<API: APIProtocol, Authenticator: TokenAuthenticatorProtocol>: MURequest, TokenHeaderAuthenticatedRequest {
  public static var url: String { "update-isonline" }
  public static var roles: Set<UserRole> { [.driver] }

  public let isOnLine: Bool

  public init(isOnLine: Bool) {
    self.isOnLine = isOnLine
  }
}
