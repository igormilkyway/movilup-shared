//  Created by Igor Sorokin

public struct ActiveOrdersRequest: AuthenticatingServerRequest {
  public typealias Success = OrdersResponse
  
  public static let url = "active_orders"

  public init() {}
}
