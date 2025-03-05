//  Created by Igor Sorokin

public struct UpdateDriverLocationRequest: TokenAuthenticatingServerRequest {
  public static let url = "update-driver-location"
  public static let roles: [UserRole] = [.driver]

  public let latitude: Double
  public let longitude: Double

  public init(latitude: Double, longitude: Double) {
    self.latitude = latitude
    self.longitude = longitude
  }
}
