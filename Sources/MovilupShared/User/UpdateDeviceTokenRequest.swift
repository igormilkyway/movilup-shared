//  Created by Igor Sorokin

public struct UpdateDeviceTokenRequest: AuthenticatingServerRequest {
  public static let url = "update-device-token"

  public let deviceToken: String

  public init(deviceToken: String) {
    self.deviceToken = deviceToken
  }
}
