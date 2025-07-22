//  Created by Igor Sorokin

import struct Foundation.UUID
import struct Foundation.Data

public struct UserDTO: ServerResponse {
  public let id: UUID
  public let email: String?
  public let firstName: String
  public let lastName: String?
  public let phoneNumber: String?
  public let imageData: Data?
  public let role: UserRole
  public var isOnLine: Bool

  public init(id: UUID,
              email: String?,
              firstName: String,
              lastName: String?,
              phoneNumber: String?,
              imageData: Data?,
              role: UserRole,
              isOnLine: Bool) {
    self.id = id
    self.email = email
    self.firstName = firstName
    self.lastName = lastName
    self.phoneNumber = phoneNumber
    self.imageData = imageData
    self.role = role
    self.isOnLine = isOnLine
  }
}
