//  Created by Igor Sorokin

import struct Foundation.UUID

public struct RouteDTO: Codable, Sendable {
  public var id: UUID?
  public var from: LocationDTO
  public var to: LocationDTO
  public var fromTo: DistanceDTO?

  public init(id: UUID? = nil, from: LocationDTO, to: LocationDTO, fromTo: DistanceDTO? = nil) {
    self.id = id
    self.from = from
    self.to = to
    self.fromTo = fromTo
  }

  public var cost: Int {
    if let meters = fromTo?.meters {
      Int(meters * 0.1)
    } else {
      500
    }
  }
}
