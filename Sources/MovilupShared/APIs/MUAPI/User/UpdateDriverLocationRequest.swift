//  Created by Igor Sorokin

public struct UpdateDriverLocationRequest<API: APIProtocol, Authenticator: TokenAuthenticatorProtocol>: MURequest, TokenHeaderAuthenticatedRequest {
  public static var url: String { "update-driver-location" }
  public static var roles: Set<UserRole> { [.driver] }

  public let coordinate: Coordinate

  public init(coordinate: Coordinate) {
    self.coordinate = coordinate
  }
}
