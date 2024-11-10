//  Created by Igor Sorokin

public struct ActiveOrdersRequest: ServerRequest {
  public typealias Response = OrdersResponse
  
  public static let url = "active_orders"

  public init() {}
}
