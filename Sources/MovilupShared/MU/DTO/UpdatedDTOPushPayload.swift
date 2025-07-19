//  Created by Igor Sorokin

import struct Foundation.UUID

public struct UpdatedDTOPushPayload: Codable, Sendable {
  public enum UpdateType: String, Codable, Sendable{
    case created
    case updated
    case deleted
  }

  public let type: UpdateType
  public let id: UUID

  public init(type: UpdateType, id: UUID) {
    self.type = type
    self.id = id
  }
}
