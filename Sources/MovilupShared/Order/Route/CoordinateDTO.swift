//

import CoreLocation

public struct CoordinateDTO: DTOType, Equatable {
  public static var url = "coordinate"

  public var id: UUID?
  public let latitude: CLLocationDegrees
  public let longitude: CLLocationDegrees

  public var isZero: Bool {
    latitude == 0 && latitude == 0
  }

  public var cl: CLLocationCoordinate2D {
    CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
  }

  public init(_ cl: CLLocationCoordinate2D) {
    self.init(id: nil, latitude: cl.latitude, longitude: cl.longitude)
  }

  public init(id: UUID?, latitude: CLLocationDegrees, longitude: CLLocationDegrees) {
    self.id = id
    self.latitude = latitude
    self.longitude = longitude
  }
}
