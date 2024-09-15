//

public struct LocationDTO: Codable, Sendable {
  public var address: String
  public var latitude: Double
  public var longitude: Double

  public init(address: String, latitude: Double, longitude: Double) {
    self.address = address
    self.latitude = latitude
    self.longitude = longitude
  }

  public var isValid: Bool {
    !address.isEmpty
  }
}
