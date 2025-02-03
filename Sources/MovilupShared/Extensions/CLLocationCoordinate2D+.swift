//  Created by Igor Sorokin

import Foundation
import CoreLocation

extension CLLocationCoordinate2D: Codable {
  enum CodingKeys: String, CodingKey {
    case latitude
    case longitude
  }

  public init(from decoder: any Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)

    let latitude = try values.decode(CLLocationDegrees.self, forKey: .latitude)
    let longitude = try values.decode(CLLocationDegrees.self, forKey: .longitude)

    self.init(latitude: latitude, longitude: longitude)
  }

  public func encode(to encoder: any Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)

    try container.encode(latitude, forKey: .latitude)
    try container.encode(longitude, forKey: .longitude)
  }
}
