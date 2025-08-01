//  Created by Igor Sorokin

public struct UpdateDeviceTokenRequest: MURequest, TokenAuthenticated {
  public static let url = "update-device-token"
  public static let roles: Set<UserRole> = .all

  public let deviceToken: String

  public init(deviceToken: String) {
    self.deviceToken = deviceToken
  }
}
