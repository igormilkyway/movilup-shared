//  Created by Igor Sorokin

import struct Foundation.UUID

public struct RouteRequest: AuthenticatingServerRequest {
  public typealias Success = RouteResponse

  public static let url = "route"

  public let orderID: UUID

  public init(orderID: UUID) {
    self.orderID = orderID
  }
}

public struct RouteResponse: ServerSuccess {
  public let fromID: UUID
  public let toID: UUID

  public init(fromID: UUID, toID: UUID) {
    self.fromID = fromID
    self.toID = toID
  }
}
