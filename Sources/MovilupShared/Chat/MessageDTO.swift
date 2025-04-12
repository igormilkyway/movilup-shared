//  Created by Igor Sorokin

import struct Foundation.UUID
import struct Foundation.Date

public struct MessageDTO: DTOType {
  public static let url = "message"

  public enum Direction: Codable, Sendable {
    case outgoing
    case incoming
  }

  public let id: UUID?
  public let date: Date
  public let text: String
  public let direction: Direction
  public let counterparty: UserRole

  public init(id: UUID? = nil, date: Date = .now, text: String, direction: Direction, counterparty: UserRole) {
    self.id = id
    self.date = date
    self.text = text
    self.direction = direction
    self.counterparty = counterparty
  }
}
