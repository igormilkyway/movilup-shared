//  Created by Igor Sorokin

import struct Foundation.UUID

public struct LocationDTO: DTOType, Equatable {
  public static let url = "location"

  public var id: UUID
  public var address: String
  public var coordinate: Coordinate
  public var floor: Floor
  public var elevator: Elevator
  public var requiresCrane: Bool
  public var hasParking: Bool

  public init(id: UUID,
              address: String,
              coordinate: Coordinate,
              floor: Floor,
              elevator: Elevator,
              requiresCrane: Bool,
              hasParking: Bool) {
    self.id = id
    self.address = address
    self.coordinate = coordinate
    self.floor = floor
    self.elevator = elevator
    self.requiresCrane = requiresCrane
    self.hasParking = hasParking
  }

  public var cost: Int {
    floor.cost
  }
}
