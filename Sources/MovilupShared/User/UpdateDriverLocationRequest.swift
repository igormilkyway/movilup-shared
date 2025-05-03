//  Created by Igor Sorokin

public struct UpdateDriverLocationRequest: TokenAuthenticatingServerRequest {
  public static let url = "update-driver-location"
  public static let roles: [UserRole] = [.driver]

  public let coordinate: CoordinateDTO

  public init(coordinate: CoordinateDTO) {
    self.coordinate = coordinate
  }
}
