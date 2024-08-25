//

import Foundation

public struct UpdatedOrderPushPayload: Codable, Sendable {
  public let orderID: UUID

  public init(orderID: UUID) {
    self.orderID = orderID
  }
}
