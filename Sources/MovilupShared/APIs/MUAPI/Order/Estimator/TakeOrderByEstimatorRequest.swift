//  Created by Igor Sorokin

import struct Foundation.UUID
import struct Foundation.Date

public struct TakeOrderByEstimatorRequest<API: APIProtocol, Authenticator: TokenAuthenticatorProtocol>: MURequest, TokenHeaderAuthenticatedRequest {
  public typealias Success = OrderDTO

  public static var url: String { "take_order_by_estimator" }
  public static var roles: Set<UserRole> { [.estimator] }

  public let orderID: UUID

  public init(orderID: UUID) {
    self.orderID = orderID
  }
}
