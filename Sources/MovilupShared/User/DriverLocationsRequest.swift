//  Created by Igor Sorokin

import struct Foundation.UUID
import struct CoreLocation.CLLocationCoordinate2D

public struct DriverLocationsRequest: AuthenticatingServerRequest {
  public typealias Success = [DriverLocation]

  public static let url = "driver-locations"

  public init() {}
}

public struct DriverLocation: ServerSuccess {
  public let driverID: UUID
  public let driverName: String
  public let coordinate: CLLocationCoordinate2D

  public init(driverID: UUID, driverName: String, coordinate: CLLocationCoordinate2D) {
    self.driverID = driverID
    self.driverName = driverName
    self.coordinate = coordinate
  }
}
