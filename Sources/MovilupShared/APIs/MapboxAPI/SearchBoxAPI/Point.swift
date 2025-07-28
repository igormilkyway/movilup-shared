//

import Foundation

public  struct Point: Codable, Sendable {
  /// This will always be "Point".
  let type: String

  /// The coordinates of the feature, formatted as [longitude,latitude].
  public let coordinate: Coordinate

  enum CodingKeys: String, CodingKey {
    case type
    case coordinate = "coordinates"
  }
}

extension Point: CustomStringConvertible {
  public var description: String {
    """
    \(coordinate)
    """
  }
}
