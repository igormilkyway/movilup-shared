//  Created by Igor Sorokin

import Foundation

public struct CreateOrderRequest: AuthenticatingServerRequest {
  public typealias Response = OrderResponse
  
  public static let url = "create_order"
  public static let authentication: ServerRequestAuthentication = .token

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
