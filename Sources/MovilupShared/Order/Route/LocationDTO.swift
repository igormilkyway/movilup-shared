//  Created by Igor Sorokin

import struct Foundation.UUID

public struct LocationDTO: DTOType {
  public static var url = "location"

  public var id: UUID?
  public var address: String?
  public var latitude: Double
  public var longitude: Double
  public var elevator: ElevatorType
  public var requiresCrane: Bool
  public var hasParking: Bool

  public init(id: UUID? = nil,
              address: String?,
              latitude: Double,
              longitude: Double,
              elevator: ElevatorType,
              requiresCrane: Bool,
              hasParking: Bool) {
    self.id = id
    self.address = address
    self.latitude = latitude
    self.longitude = longitude
    self.elevator = elevator
    self.requiresCrane = requiresCrane
    self.hasParking = hasParking
  }

//  public var location: LocationCoordinate2D {
//    .init(latitude: latitude, longitude: longitude)
//  }
}
