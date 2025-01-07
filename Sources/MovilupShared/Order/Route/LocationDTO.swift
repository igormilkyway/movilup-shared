//

import struct Foundation.UUID
import class CoreLocation.CLLocation

public struct LocationDTO: Codable, Sendable {
  public var id: UUID?
  public var address: String?
  public var latitude: Double
  public var longitude: Double

  public init(id: UUID? = nil, address: String?, latitude: Double, longitude: Double) {
    self.id = id
    self.address = address
    self.latitude = latitude
    self.longitude = longitude
  }

  public var location: CLLocation {
    .init(latitude: latitude, longitude: longitude)
  }
}
