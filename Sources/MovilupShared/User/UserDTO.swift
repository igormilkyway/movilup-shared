//

import struct Foundation.URL
import struct Foundation.UUID

public struct UserDTO: Codable {
  public let id: UUID?
  public let email: String?
  public let firstName: String
  public let lastName: String?
  public let phoneNumber: String?
  public let imageURL: String?
  public let role: UserRole?

  public init(id: UUID?, email: String?, firstName: String, lastName: String?, phoneNumber: String?, imageURL: String?, role: UserRole?) {
    self.id = id
    self.email = email
    self.firstName = firstName
    self.lastName = lastName
    self.phoneNumber = phoneNumber
    self.role = role
    self.imageURL = imageURL
  }
}
