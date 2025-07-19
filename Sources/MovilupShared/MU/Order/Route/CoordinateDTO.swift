//

import Foundation

public struct CoordinateDTO: DTOType, Equatable {
  public static let url = "coordinate"

  public var id: UUID?
  public let latitude: Double
  public let longitude: Double

  public var isZero: Bool {
    latitude == 0 && latitude == 0
  }

  public init(id: UUID?, latitude: Double, longitude: Double) {
    self.id = id
    self.latitude = latitude
    self.longitude = longitude
  }
}
