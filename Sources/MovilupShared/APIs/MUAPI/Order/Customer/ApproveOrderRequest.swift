//  Created by Igor Sorokin

import struct Foundation.UUID

public struct ApproveOrderRequest<API: APIProtocol, Authenticator: TokenAuthenticatorProtocol>: MURequest, TokenHeaderAuthenticatedRequest {
  public typealias Success = OrderDTO

  public static var url: String { "approve_order" }
  public static var roles: Set<UserRole> { [.customer, .demoCustomer] }

  public init() {}
}
