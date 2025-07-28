//  Created by Igor Sorokin

import struct Foundation.UUID
import struct Foundation.Date

public struct TakenByEstimator: Codable {
  public let date: Date
  public var estimatedDate: Date
}

public struct TakenByDriver: Codable {
  public let date: Date
  public var coordinate: Coordinate
  public var distance: Distance
}

public struct OrderDTO: DTOType {
  public static let url = "order"

  public let id: UUID?
  public var arrivedAtDeparturePlannedDate: Date?
  public let createdDate: Date

  public var takenByEstimator: TakenByEstimator?

  public let approvedDate: Date?

  public var takenByDriver: TakenByDriver?

  public let arrivedAtDepartureDate: Date?
  public let loadedDate: Date?
  public let arrivedAtDestinationDate: Date?
  public let closedDate: Date?

  public let finalCost: Int?
  public let state: OrderState
  public var route: RouteDTO
  public var cargo: CargoDTO

  public init(id: UUID?,
              arrivedAtDeparturePlannedDate: Date?,
              createdDate: Date,
              takenByEstimator: TakenByEstimator?,
              approvedDate: Date?,
              takenByDriver: TakenByDriver?,
              arrivedAtDepartureDate: Date?,
              loadedDate: Date?,
              arrivedAtDestinationDate: Date?,
              closedDate: Date?,
              finalCost: Int?,
              state: OrderState,
              route: RouteDTO,
              cargo: CargoDTO) {
    self.id = id
    self.arrivedAtDeparturePlannedDate = arrivedAtDeparturePlannedDate
    self.createdDate = createdDate
    self.takenByEstimator = takenByEstimator
    self.approvedDate = approvedDate
    self.takenByDriver = takenByDriver
    self.arrivedAtDepartureDate = arrivedAtDepartureDate
    self.loadedDate = loadedDate
    self.arrivedAtDestinationDate = arrivedAtDestinationDate
    self.closedDate = closedDate
    self.finalCost = finalCost
    self.state = state
    self.route = route
    self.cargo = cargo
  }

  public var cost: Int {
    route.cost + cargo.cost
  }
}
