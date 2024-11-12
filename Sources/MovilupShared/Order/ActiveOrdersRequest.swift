//  Created by Igor Sorokin

public struct ActiveOrdersRequest: AuthenticatingServerRequest {
  public typealias Response = OrdersResponse
  
  public static let url = "active_orders"
  public static let authentication: ServerRequestAuthentication = .token

  public init() {}
}
