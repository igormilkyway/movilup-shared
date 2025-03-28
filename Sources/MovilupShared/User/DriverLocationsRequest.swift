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
  public let latitude: Double
  public let longitude: Double

  public init(driverID: UUID, driverName: String, latitude: Double, longitude: Double) {
    self.driverID = driverID
    self.driverName = driverName
    self.latitude = latitude
    self.longitude = longitude
  }
}
