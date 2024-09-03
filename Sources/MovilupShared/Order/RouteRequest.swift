//

import Foundation

public struct RouteRequest: ServerRequest {
  public typealias Response = RouteResponse
  public static let url = "route"

  public let orderID: UUID

  public init(orderID: UUID) {
    self.orderID = orderID
  }
}

public struct RouteResponse: ServerResponse {
  public let fromID: UUID
  public let toID: UUID

  public init(fromID: UUID, toID: UUID) {
    self.fromID = fromID
    self.toID = toID
  }
}
