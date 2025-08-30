//

import Numerics

extension Coordinate: Equatable {
  public static func == (lhs: Self, rhs: Self) -> Bool {
    lhs.latitude.isApproximatelyEqual(to: rhs.latitude) && lhs.longitude.isApproximatelyEqual(to: rhs.longitude)
  }
}

public struct Coordinate: Codable, Sendable {
  @AsUnkeyed(order: 1)
  public var latitude: Double = 0

  @AsUnkeyed(order: 0)
  public var longitude: Double = 0

  public var isZero: Bool {
    latitude == 0 && longitude == 0
  }

  public init(latitude: Double, longitude: Double) {
    self.latitude = latitude
    self.longitude = longitude
  }
}

extension Coordinate: CustomStringConvertible {
  public var description: String {
    """
    lat: \(latitude), lon: \(longitude)
    """
  }
}

public extension Coordinate {
  init(from decoder: any Decoder) throws {
    do {
      let container = try decoder.container(keyedBy: CodingKeys.self)
      let longitude = try container.decode(Double.self, forKey: .longitude)
      let latitude = try container.decode(Double.self, forKey: .latitude)
      self.init(latitude: latitude, longitude: longitude)
    } catch DecodingError.typeMismatch {
      var container = try decoder.unkeyedContainer()
      let longitude = try container.decode(Double.self)
      let latitude = try container.decode(Double.self)
      self.init(latitude: latitude, longitude: longitude)
    }
  }
}

//  func encode(to encoder: any Encoder) throws {
//    var container = encoder.container(keyedBy: CodingKeys.self)
//
//    try container.encode(longitude, forKey: .longitude)
//    try container.encode(latitude, forKey: .latitude)

//    var container = encoder.unkeyedContainer()
//
//    try container.encode(longitude)
//    try container.encode(latitude)
//  }

public extension Coordinate {
  static var ta: Coordinate {
    .init(latitude: 32.08, longitude: 34.78)
  }

  static var tr: Coordinate {
    .init(latitude: 36.780806, longitude: 31.403028)
  }

  static var mock: Coordinate {
    .ta
  }
}

@propertyWrapper
public struct AsUnkeyed<Value>: Codable, Sendable where Value: Codable, Value: Equatable, Value: Sendable {
  private var value: Value
  private var order = 0
  private var separator = ","

  public var projectedValue: (order: Int, separator: String) {
    (order: order, separator: separator)
  }

  public var wrappedValue: Value {
    get {
      value
    }

    set {
      value = newValue
    }
  }

  public init(wrappedValue value: Value, order: Int) {
    self.value = value
    self.order = order
  }

  public init(wrappedValue value: Value, order: Int, separator: String) {
    self.value = value
    self.order = order
    self.separator = separator
  }


  private enum CodingKeys: CodingKey {
    case value
  }
  
  public init(from decoder: any Decoder) throws {
    let container = try decoder.singleValueContainer()

    self.value = try container.decode(Value.self)
  }
  
  public func encode(to encoder: any Encoder) throws {
    var container = encoder.singleValueContainer()
    try container.encode(value)
  }
}

extension AsUnkeyed: Equatable {
  public static func == (lhs: AsUnkeyed<Value>, rhs: AsUnkeyed<Value>) -> Bool {
    lhs.value == rhs.value
  }
}

extension Array where Element == Coordinate {
  var serialized: String {
    map {
      "\($0.longitude),\($0.latitude)"
    }
    .joined(separator: ";")
  }
}
