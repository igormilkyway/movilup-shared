//  Created by Igor Sorokin

import struct Foundation.UUID

public struct LocationDTO: DTOType {
  public static var url = "location"

  public var id: UUID?
  public var address: String?
  public var latitude: Double
  public var longitude: Double
  public var floor: Floor
  public var elevator: Elevator
  public var requiresCrane: Bool
  public var hasParking: Bool

  public init(id: UUID? = nil,
              address: String?,
              latitude: Double,
              longitude: Double,
              floor: Floor,
              elevator: Elevator,
              requiresCrane: Bool,
              hasParking: Bool) {
    self.id = id
    self.address = address
    self.latitude = latitude
    self.longitude = longitude
    self.floor = floor
    self.elevator = elevator
    self.requiresCrane = requiresCrane
    self.hasParking = hasParking
  }

//  public var location: LocationCoordinate2D {
//    .init(latitude: latitude, longitude: longitude)
//  }

  public var cost: Int {
    floor.cost
  }
}
