//  Created by Igor Sorokin

import struct Foundation.UUID
import struct Foundation.Date

public struct OrderDTO: DTOType {
  public static var url = "order"

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
  public let finalCost: Int?
  public let state: OrderState
  public var route: RouteDTO
  public var cargo: CargoDTO

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
              finalCost: Int?,
              state: OrderState,
              route: RouteDTO,
              cargo: CargoDTO) {
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
    self.finalCost = finalCost
    self.state = state
    self.route = route
    self.cargo = cargo
  }

  public var cost: Int {
    route.cost + cargo.cost
  }

  public static let updatedActiveOrderNotificationCategoryID = "UpdatedActiveOrder"
}
