//  Created by Igor Sorokin

import Foundation

public typealias OrdersResponse = [OrderResponse]

public struct OrdersRequest: AuthenticatingServerRequest {
  public typealias Response = OrdersResponse
  public static let url = "orders"
  public static let authentication: ServerRequestAuthentication = .muToken

  public let state: OrderState?

  public init(state: OrderState?) {
    self.state = state
  }
}
