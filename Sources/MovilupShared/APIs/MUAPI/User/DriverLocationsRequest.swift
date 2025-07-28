//  Created by Igor Sorokin

import struct Foundation.UUID

public struct DriverLocationsRequest: MURequest, TokenAuthenticated {
  public typealias Success = [DriverLocation]

  public static let url = "driver-locations"

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
