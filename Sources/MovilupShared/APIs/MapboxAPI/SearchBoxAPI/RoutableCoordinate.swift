//

import Foundation

protocol Coordinated {
  var latitude: Double { get set }
  var longitude: Double { get set }
  var coordinate: Coordinate { get }
}

extension Coordinated {
  var coordinate: Coordinate {
    get {
      .init(latitude: latitude, longitude: longitude)
    }

    set {
      latitude = newValue.latitude
      longitude = newValue.longitude
    }
  }
}

struct RoutableCoordinate: Coordinated, Codable, CustomStringConvertible {
  /// The latitudinal coordinate of the result.
  var latitude: Double

  /// The longitudinal coordinate of the result.
  var longitude: Double

  /// The accuracy of the geographical coordinate of the result.
  /// This is only available for address-type results.
  let accuracy: Accuracy?

  /// An array of objects containing information about the feature's routable points.
  let routablePoints: [RoutablePoint]?

  enum CodingKeys: String, CodingKey {
    case latitude
    case longitude
    case accuracy
    case routablePoints = "routable_points"
  }

  var description: String {
    """
    \(coordinate) \
    \(accuracy != nil ? "\n  accuracy: \(accuracy!)" : "" ) \
    \(routablePoints != nil ? "\n  routablePoints: \(routablePoints!)" : "" )
    """
  }
}

enum Accuracy: String, Codable {
  case rooftop
  case parcel
  case point
  case interpolated
  case intersection
  case approximate
  case proximate
  case street
}

struct RoutablePoint: Coordinated, Codable, CustomStringConvertible {
  let name: String
  var latitude: Double
  var longitude: Double
  let note: String?

  var description: String {
    """
    name: \(name) - \(coordinate)
    \(note != nil ? "\n  note: \(note!)" : "" )
    """
  }
}
