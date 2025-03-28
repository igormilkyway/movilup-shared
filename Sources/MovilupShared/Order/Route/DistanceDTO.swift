//  Created by Igor Sorokin

public struct DistanceDTO: Codable, Sendable, Equatable {
//  public let id: UUID?
//  public let from: LocationDTO
//  public let to: LocationDTO
  public let meters: Double
  public let minutes: Double
  public let isReal: Bool

  public init(/*id: UUID? = nil, from: LocationDTO, to: LocationDTO, */meters: Double, minutes: Double, isReal: Bool) {
//    self.id = id
//    self.from = from
//    self.to = to
    self.meters = meters
    self.minutes = minutes
    self.isReal = isReal
  }
}
