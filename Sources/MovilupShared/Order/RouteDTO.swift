//  Created by Igor Sorokin

public struct RouteDTO: Codable, Sendable {
  public var from: LocationDTO
  public var to: LocationDTO

  public init(from: LocationDTO, to: LocationDTO) {
    self.from = from
    self.to = to
  }

  public var isValid: Bool {
    from.isValid && to.isValid
  }
}
