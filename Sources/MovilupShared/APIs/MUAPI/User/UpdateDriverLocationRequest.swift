//  Created by Igor Sorokin

public struct UpdateDriverLocationRequest: MURequest, TokenAuthenticated {
  public static let url = "update-driver-location"
  public static let roles: [UserRole] = [.driver]

  public let coordinate: Coordinate

  public init(coordinate: Coordinate) {
    self.coordinate = coordinate
  }
}
