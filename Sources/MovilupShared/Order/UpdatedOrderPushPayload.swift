//  Created by Igor Sorokin

import struct Foundation.UUID

public struct UpdatedOrderPushPayload: Codable, Sendable {
  public enum UpdateType: String, Codable, Sendable{
    case created
    case updated
    case deleted
  }

  public let type: UpdateType
  public let orderID: UUID

  public init(type: UpdateType, orderID: UUID) {
    self.type = type
    self.orderID = orderID
  }
}
