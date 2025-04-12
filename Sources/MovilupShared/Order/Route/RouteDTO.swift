//  Created by Igor Sorokin

import struct Foundation.UUID

public struct RouteDTO: DTOType {
  public static var url = "route"

  public var id: UUID?
  public var from: LocationDTO
  public var to: LocationDTO
  public var fromTo: DistanceDTO

  public init(id: UUID? = nil, from: LocationDTO, to: LocationDTO, fromTo: DistanceDTO) {
    self.id = id
    self.from = from
    self.to = to
    self.fromTo = fromTo
  }

  public var cost: Int {
    fromTo.cost + from.cost + to.cost
  }
}
