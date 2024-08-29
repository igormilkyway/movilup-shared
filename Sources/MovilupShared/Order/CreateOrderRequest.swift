//

import Foundation

public struct CreateOrderRequest: ServerRequest {
  public typealias Response = EmptyServerResponse
  public static let url = "create_order"

  public let arrivedAtDeparturePlannedDate: Date
  public let route: OrderRouteDTO
  public let cargo: CargoDTO

  public init(arrivedAtDeparturePlannedDate: Date, 
              route: OrderRouteDTO,
              cargo: CargoDTO) {
    self.arrivedAtDeparturePlannedDate = arrivedAtDeparturePlannedDate
    self.route = route
    self.cargo = cargo
  }
}
