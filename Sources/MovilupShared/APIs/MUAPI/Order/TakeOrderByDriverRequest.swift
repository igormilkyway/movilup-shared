//  Created by Igor Sorokin

import struct Foundation.UUID
import struct Foundation.Date

public struct TakeOrderByDriverRequest: MURequest, TokenAuthenticated {
  public typealias Success = OrderDTO

  public static let url = "take_order_by_driver"
  public static let roles: Set<UserRole> = [.driver]

  public let orderID: UUID
  public let coordinate: Coordinate

  public init(orderID: UUID, coordinate: Coordinate) {
    self.orderID = orderID
    self.coordinate = coordinate
  }
}
