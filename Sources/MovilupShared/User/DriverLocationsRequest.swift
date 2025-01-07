//  Created by Igor Sorokin

import struct Foundation.UUID

public struct DriverLocationsRequest: AuthenticatingServerRequest {
  public typealias Success = [DriverLocation]

  public static let url = "driver-locations"

  public init() {}
}

public struct DriverLocation: ServerSuccess {
  public let driverID: UUID
  public let latitude: Double
  public let longitude: Double

  public init(driverID: UUID, latitude: Double, longitude: Double) {
    self.driverID = driverID
    self.latitude = latitude
    self.longitude = longitude
  }
}
