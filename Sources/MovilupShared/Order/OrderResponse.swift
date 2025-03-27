//  Created by Igor Sorokin

import struct Foundation.UUID
import struct Foundation.Date

public struct OrderResponse: ServerSuccess {
  public let id: UUID?
  public var arrivedAtDeparturePlannedDate: Date?
  public let createdDate: Date
  public let takenByEstimatorDate: Date?
  public let estimatedDate: Date?
  public let approvedDate: Date?
  public let takenByDriverDate: Date?
  public let arrivedAtDepartureDate: Date?
  public let loadedDate: Date?
  public let arrivedAtDestinationDate: Date?
  public let closedDate: Date?
  public let state: OrderState
  public var route: RouteDTO
  public var cargo: CargoDTO
  public var elevator: ElevatorType
  public var requiresCrane: Bool
  public var hasParking: Bool

  public init(id: UUID?,
              arrivedAtDeparturePlannedDate: Date?,
              createdDate: Date,
              takenByEstimatorDate: Date?,
              estimatedDate: Date?,
              approvedDate: Date?,
              takenByDriverDate: Date?,
              arrivedAtDepartureDate: Date?,
              loadedDate: Date?,
              arrivedAtDestinationDate: Date?,
              closedDate: Date?,
              state: OrderState,
              route: RouteDTO,
              cargo: CargoDTO,
              elevator: ElevatorType,
              requiresCrane: Bool,
              hasParking: Bool) {
    self.id = id
    self.arrivedAtDeparturePlannedDate = arrivedAtDeparturePlannedDate
    self.createdDate = createdDate
    self.takenByEstimatorDate = takenByEstimatorDate
    self.estimatedDate = estimatedDate
    self.approvedDate = approvedDate
    self.takenByDriverDate = takenByDriverDate
    self.arrivedAtDepartureDate = arrivedAtDepartureDate
    self.loadedDate = loadedDate
    self.arrivedAtDestinationDate = arrivedAtDestinationDate
    self.closedDate = closedDate
    self.state = state
    self.route = route
    self.cargo = cargo
    self.elevator = elevator
    self.requiresCrane = requiresCrane
    self.hasParking = hasParking
  }

  public var cost: Int {
    route.cost + cargo.cost
  }
}
