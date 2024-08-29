//

public struct OrderRouteDTO: Codable {
  public var from: LocationDTO
  public var to: LocationDTO

  public init(from: LocationDTO, to: LocationDTO) {
    self.from = from
    self.to = to
  }
}

public struct LocationDTO: Codable {
  public var address: String
  public var latitude: Double
  public var longitude: Double

  public init(address: String, latitude: Double, longitude: Double) {
    self.address = address
    self.latitude = latitude
    self.longitude = longitude
  }
}
