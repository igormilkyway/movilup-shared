//  Created by Igor Sorokin

public struct UpdateDeviceTokenRequest: MURequest, TokenAuthenticated {
  public static let url = "update-device-token"

  public let deviceToken: String

  public init(deviceToken: String) {
    self.deviceToken = deviceToken
  }
}
