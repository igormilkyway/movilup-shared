//

import Foundation

public typealias OrdersResponse = [OrdersResponseElement]

public struct OrdersRequest: ServerRequest {
  public typealias Response = OrdersResponse
  public static let url = "orders"

  public let state: OrderState?

  public init(_ state: OrderState?) {
    self.state = state
  }
}

public struct OrdersResponseElement: ServerResponse {
  public let id: UUID
  public let arrivedAtDeparturePlannedDate: Date
  public let createdDate: Date
  public let estimatedDate: Date?
  public let approvedDate: Date?
  public let driverTakenDate: Date?
  public let arrivedAtDepartureDate: Date?
  public let loadedDate: Date?
  public let arrivedAtDestinationDate: Date?
  public let closedDate: Date?
  public let state: OrderState
  public let route: RouteDTO
  public var cargo: CargoDTO

  public init(id: UUID, 
              arrivedAtDeparturePlannedDate: Date,
              createdDate: Date,
              estimatedDate: Date?,
              approvedDate: Date?,
              driverTakenDate: Date?,
              arrivedAtDepartureDate: Date?,
              loadedDate: Date?,
              arrivedAtDestinationDate: Date?,
              closedDate: Date?,
              state: OrderState,
              route: RouteDTO,
              cargo: CargoDTO) {
    self.id = id
    self.arrivedAtDeparturePlannedDate = arrivedAtDeparturePlannedDate
    self.createdDate = createdDate
    self.estimatedDate = estimatedDate
    self.approvedDate = approvedDate
    self.driverTakenDate = driverTakenDate
    self.arrivedAtDepartureDate = arrivedAtDepartureDate
    self.loadedDate = loadedDate
    self.arrivedAtDestinationDate = arrivedAtDestinationDate
    self.closedDate = closedDate
    self.state = state
    self.route = route
    self.cargo = cargo
  }
}
