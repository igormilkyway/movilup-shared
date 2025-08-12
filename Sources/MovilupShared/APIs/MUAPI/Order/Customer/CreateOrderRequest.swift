//  Created by Igor Sorokin

public struct CreateOrderRequest<API: APIProtocol, Authenticator: TokenAuthenticatorProtocol>: MURequest, TokenHeaderAuthenticatedRequest {
  public typealias Success = OrderDTO
  public typealias Failure = MeError

  public static var url: String { "create_order" }
  public static var roles: Set<UserRole> { [.customer, .demoCustomer] }

  public let order: OrderDTO

  public init(order: OrderDTO) {
    self.order = order
  }
}

import struct Foundation.Date

public struct CreatedOrder {
  public var arrivedAtDeparturePlannedDate: Date?
  public var route: RouteDTO
  public var cargo: CargoDTO
}
