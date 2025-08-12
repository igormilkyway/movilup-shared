//  Created by Igor Sorokin

public struct UpdateDriverNeedsLoadersRequest<API: APIProtocol, Authenticator: TokenAuthenticatorProtocol>: MURequest, TokenHeaderAuthenticatedRequest {
  public static var url: String { "update-driver-needs-loaders" }
  public static var roles: Set<UserRole> { [.driver] }

  public let needsLoaders: Bool

  public init(needsLoaders: Bool) {
    self.needsLoaders = needsLoaders
  }
}
