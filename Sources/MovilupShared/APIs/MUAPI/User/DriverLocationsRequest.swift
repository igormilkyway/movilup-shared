//  Created by Igor Sorokin

import struct Foundation.UUID

public struct DriverLocationsRequest<API: APIProtocol, Authenticator: TokenAuthenticatorProtocol>: MURequest, TokenHeaderAuthenticatedRequest {
  public typealias Success = [DriverLocation]

  public static var url: String { "driver-locations" }
  public static var roles: Set<UserRole> { [.customer, .demoCustomer, .owner] }

  public init() {}
}

public struct DriverLocation: ServerResponse {
  public let driverID: UUID
  public let driverName: String
  public let coordinate: Coordinate

  public init(driverID: UUID, driverName: String, coordinate: Coordinate) {
    self.driverID = driverID
    self.driverName = driverName
    self.coordinate = coordinate
  }
}
