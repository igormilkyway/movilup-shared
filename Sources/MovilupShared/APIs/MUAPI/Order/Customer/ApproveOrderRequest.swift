//  Created by Igor Sorokin

import struct Foundation.UUID

public struct ApproveOrderRequest: MURequest, TokenAuthenticated {
  public typealias Success = OrderDTO

  public static let url = "approve_order"
  public static let roles: Set<UserRole> = [.customer, .demoCustomer]

  public init() {}
}
