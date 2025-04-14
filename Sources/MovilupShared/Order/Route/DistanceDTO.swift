//  Created by Igor Sorokin

import Foundation

public struct DistanceDTO: Codable, Sendable, Equatable {
  public let id: UUID?
  public let meters: Double
  public let minutes: Double
  public let isReal: Bool

  public init(id: UUID?, meters: Double, minutes: Double, isReal: Bool) {
    self.id = id
    self.meters = meters
    self.minutes = minutes
    self.isReal = isReal
  }

  public var cost: Int {
    if meters > 0 {
      Int(meters * 0.1)
    } else {
      500
    }
  }
}
