//

import Foundation

public struct Feature: Codable, Sendable {
  /// This will always be "Feature".
  let type: String

  /// An object describing the spatial geometry of the returned feature.
  public let geometry: Point

  /// The specific properties associated with the returned feature.
  public let properties: Properties

  enum CodingKeys: String, CodingKey {
    case type
    case geometry
    case properties
  }
}

extension Feature: CustomStringConvertible {
  public var description: String {
    """
    
    geometry: \(geometry)
    properties:
    \(properties)
    """
  }
}
