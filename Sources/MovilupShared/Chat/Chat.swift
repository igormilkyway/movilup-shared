//  Created by Igor Sorokin

import struct Foundation.UUID

public enum Chat: Sendable, Codable {
  case user(id: UUID)
  case order(id: UUID)
}
