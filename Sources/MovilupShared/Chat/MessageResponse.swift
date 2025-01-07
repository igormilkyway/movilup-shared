//  Created by Igor Sorokin

import struct Foundation.UUID
import struct Foundation.Date

public struct MessageResponse: ServerSuccess {
  public let id: UUID
  public let date: Date
  public let text: String
  public let sender: UserResponse

  public init(id: UUID, date: Date, text: String, sender: UserResponse) {
    self.id = id
    self.date = date
    self.text = text
    self.sender = sender
  }
}
