//  Created by Igor Sorokin

import struct Foundation.UUID

public struct OrderRequest: TokenAuthenticatingServerRequest {
  public typealias Success = OrderResponse
  
  public static let url = "order"

  public let id: UUID

  public init(id: UUID) {
    self.id = id
  }
}
