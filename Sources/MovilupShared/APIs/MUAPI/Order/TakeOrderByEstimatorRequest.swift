//  Created by Igor Sorokin

import struct Foundation.UUID
import struct Foundation.Date

public struct TakeOrderByEstimatorRequest: MURequest, TokenAuthenticated {
  public typealias Success = OrderDTO

  public static let url = "take_order_by_estimator"
  public static let roles: [UserRole] = [.estimator]

  public let orderID: UUID

  public init(orderID: UUID) {
    self.orderID = orderID
  }
}
