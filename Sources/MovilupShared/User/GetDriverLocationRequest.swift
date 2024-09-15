//  Created by Igor Sorokin

import Foundation

public struct GetDriverLocationRequest: ServerRequest {
  public typealias Response = [GetDriverLocationResponse]
  public static let url = "get-driver-location"
}

public struct GetDriverLocationResponse: Codable {
  public let driverID: UUID
  public let latitude: Double
  public let longitude: Double

  public init(driverID: UUID, latitude: Double, longitude: Double) {
    self.driverID = driverID
    self.latitude = latitude
    self.longitude = longitude
  }
}
