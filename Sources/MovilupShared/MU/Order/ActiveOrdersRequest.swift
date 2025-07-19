//  Created by Igor Sorokin

public struct ActiveOrderRequest: MURequest, TokenAuthenticated {
  public typealias Success = OrderDTO?

  public static let url = "active_order"

  public init() {}
}
