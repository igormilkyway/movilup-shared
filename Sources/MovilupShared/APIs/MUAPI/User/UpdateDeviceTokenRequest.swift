//  Created by Igor Sorokin

public struct UpdateDeviceTokenRequest<API: APIProtocol, Authenticator: TokenAuthenticatorProtocol>: MURequest, TokenHeaderAuthenticatedRequest {
  public static var url: String { "update-device-token" }
  public static var roles: Set<UserRole> { .all }

  public let deviceToken: String

  public init(deviceToken: String) {
    self.deviceToken = deviceToken
  }
}
