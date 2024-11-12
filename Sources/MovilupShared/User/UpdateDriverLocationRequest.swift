//  Created by Igor Sorokin

public struct UpdateDriverLocationRequest: AuthenticatingServerRequest {
  public typealias Response = EmptyServerResponse
  public static let url = "update-driver-location"
  public static let authentication: ServerRequestAuthentication = .token

  public let latitude: Double
  public let longitude: Double

  public init(latitude: Double, longitude: Double) {
    self.latitude = latitude
    self.longitude = longitude
  }
}
