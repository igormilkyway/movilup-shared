//

public struct UpdateDeviceTokenRequest: ServerRequest {
  public typealias Response = EmptyServerResponse
  public static let url = "update-device-token"

  public let deviceToken: String

  public init(deviceToken: String) {
    self.deviceToken = deviceToken
  }
}
