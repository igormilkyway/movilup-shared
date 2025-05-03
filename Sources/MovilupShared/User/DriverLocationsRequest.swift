//  Created by Igor Sorokin

import struct Foundation.UUID

public struct DriverLocationsRequest: TokenAuthenticatingServerRequest {
  public typealias Success = [DriverLocation]

  public static let url = "driver-locations"

  public init() {}
}

public struct DriverLocation: ServerSuccess {
  public let driverID: UUID
  public let driverName: String
  public let coordinate: CoordinateDTO

  public init(driverID: UUID, driverName: String, coordinate: CoordinateDTO) {
    self.driverID = driverID
    self.driverName = driverName
    self.coordinate = coordinate
  }
}
