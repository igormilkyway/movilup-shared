//  Created by Igor Sorokin

public struct OrderActivityContentState: Codable & Hashable {
  public let orderState: OrderState

  public init(orderState: OrderState) {
    self.orderState = orderState
  }
}
