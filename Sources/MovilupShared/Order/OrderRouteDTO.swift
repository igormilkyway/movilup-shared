//

public struct OrderRouteDTO: Codable {
  public let from: LocationDTO
  public let to: LocationDTO

  public init(from: LocationDTO, to: LocationDTO) {
    self.from = from
    self.to = to
  }
}

public struct LocationDTO: Codable {
  public let address: String
  public let latitude: Double
  public let longitude: Double

  public init(address: String, latitude: Double, longitude: Double) {
    self.address = address
    self.latitude = latitude
    self.longitude = longitude
  }
}
