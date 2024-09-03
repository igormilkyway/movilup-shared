//

import Foundation

public struct CreateOrderRequest: ServerRequest {
  public typealias Response = EmptyServerResponse
  public static let url = "create_order"

  public let arrivedAtDeparturePlannedDate: Date
  public let route: RouteDTO
  public let cargo: CargoDTO

  public init(arrivedAtDeparturePlannedDate: Date, 
              route: RouteDTO,
              cargo: CargoDTO) {
    self.arrivedAtDeparturePlannedDate = arrivedAtDeparturePlannedDate
    self.route = route
    self.cargo = cargo
  }
}
