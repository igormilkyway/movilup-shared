//  Created by Igor Sorokin

public struct ActiveOrderRequest: TokenAuthenticatingServerRequest {
  public typealias Success = OrderDTO?

  public static let url = "active_order"

  public init() {}
}
