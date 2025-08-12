//  Created by Igor Sorokin

import struct Foundation.UUID
import struct Foundation.Date

public struct TakeOrderByDriverRequest<API: APIProtocol, Authenticator: TokenAuthenticatorProtocol>: MURequest, TokenHeaderAuthenticatedRequest {
  public typealias Success = OrderDTO

  public static var url: String { "take_order_by_driver" }
  public static var roles: Set<UserRole> { [.driver] }

  public let orderID: UUID
  public let coordinate: Coordinate

  public init(orderID: UUID, coordinate: Coordinate) {
    self.orderID = orderID
    self.coordinate = coordinate
  }
}
