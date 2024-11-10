//  Created by Igor Sorokin

public struct UpdateDeviceTokenRequest: AuthenticatingServerRequest {
  public typealias Response = EmptyServerResponse
  public static let url = "update-device-token"
  public static let authentication: ServerRequestAuthentication = .muToken

  public let deviceToken: String

  public init(deviceToken: String) {
    self.deviceToken = deviceToken
  }
}
