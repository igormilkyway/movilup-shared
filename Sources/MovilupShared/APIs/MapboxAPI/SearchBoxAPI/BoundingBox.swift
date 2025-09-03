//

/// Bounding boxes should be supplied as 4 numbers separated by commas,
/// in `minimum longitude,minimum latitude,maximum longitude,maximum latitude`order.
/// The bounding box cannot cross the 180th meridian.
public struct BoundingBox: Codable, Sendable {
  var center: Coordinate {
    get {
      Coordinate(latitude: (minLatitude + maxLatitude) / 2, longitude: (minLongitude + maxLatitude) / 2)
    }
  }

  var latitudeDelta: Double {
    maxLatitude - minLatitude
  }

  var longitudeDelta: Double {
    maxLongitude - minLongitude
  }

  public var northWest: Coordinate {
    get {
      Coordinate(latitude: maxLatitude, longitude: minLongitude)
    }

    set {
      maxLatitude = newValue.latitude
      minLongitude = newValue.longitude
    }
  }

  public var southWest: Coordinate {
    get {
      Coordinate(latitude: minLatitude, longitude: minLongitude)
    }

    set {
      minLatitude = newValue.latitude
      minLongitude = newValue.longitude
    }
  }

  public var northEast: Coordinate {
    get {
      Coordinate(latitude: maxLatitude, longitude: maxLongitude)
    }

    set {
      maxLatitude = newValue.latitude
      maxLongitude = newValue.longitude
    }
  }

  public var southEast: Coordinate {
    get {
      Coordinate(latitude: minLatitude, longitude: maxLongitude)
    }

    set {
      minLatitude = newValue.latitude
      maxLongitude = newValue.longitude
    }
  }

  @AsUnkeyed(order: 0)
  var minLongitude: Double = 0

  @AsUnkeyed(order: 1)
  var minLatitude: Double = 0

  @AsUnkeyed(order: 2)
  var maxLongitude: Double = 0

  @AsUnkeyed(order: 3)
  var maxLatitude: Double = 0

  public init(minLongitude: Double, minLatitude: Double, maxLongitude: Double, maxLatitude: Double) {
    self.minLongitude = minLongitude
    self.minLatitude = minLatitude
    self.maxLongitude = maxLongitude
    self.maxLatitude = maxLatitude
  }

  public func contains(_ coordinate: Coordinate) -> Bool {
    (coordinate.latitude >= minLatitude) && (coordinate.latitude <= maxLatitude)
    &&
    (coordinate.longitude >= minLongitude) && (coordinate.longitude <= maxLongitude)
  }
}

public extension BoundingBox {
}

public extension BoundingBox {
  init(from decoder: any Decoder) throws {
    do {
      let container = try decoder.container(keyedBy: CodingKeys.self)
      let minLongitude = try container.decode(Double.self, forKey: .minLongitude)
      let minLatitude = try container.decode(Double.self, forKey: .minLatitude)
      let maxLongitude = try container.decode(Double.self, forKey: .maxLongitude)
      let maxLatitude = try container.decode(Double.self, forKey: .maxLatitude)

      self.init(minLongitude: minLongitude, minLatitude: minLatitude, maxLongitude: maxLongitude, maxLatitude: maxLatitude)
    } catch DecodingError.typeMismatch {
      var container = try decoder.unkeyedContainer()
      let minLongitude = try container.decode(Double.self)
      let minLatitude = try container.decode(Double.self)
      let maxLongitude = try container.decode(Double.self)
      let maxLatitude = try container.decode(Double.self)

      self.init(minLongitude: minLongitude, minLatitude: minLatitude, maxLongitude: maxLongitude, maxLatitude: maxLatitude)
    }
  }
}

extension BoundingBox: CustomStringConvertible {
  public var description: String {
    """
    center: \(center)
    """
  }
}
