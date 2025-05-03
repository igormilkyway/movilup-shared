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
//
//  enum CodingKeys: String, CodingKey {
//    case latitude
//    case longitude
//  }
//
//  public init(from decoder: any Decoder) throws {
//    let values = try decoder.container(keyedBy: CodingKeys.self)
//
//    let latitude = try values.decode(CLLocationDegrees.self, forKey: .latitude)
//    let longitude = try values.decode(CLLocationDegrees.self, forKey: .longitude)
//
//    self.init(latitude: latitude, longitude: longitude)
//  }
//
//  public func encode(to encoder: any Encoder) throws {
//    var container = encoder.container(keyedBy: CodingKeys.self)
//
//    try container.encode(latitude, forKey: .latitude)
//    try container.encode(longitude, forKey: .longitude)
//  }
}
