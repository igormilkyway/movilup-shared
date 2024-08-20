//

import struct Foundation.URL
import struct Foundation.UUID

public struct UserDTO: Codable {
  public let id: UUID?
  public let email: String?
  public let firstName: String
  public let lastName: String?
  public let phoneNumber: String?
  public let imageURL: URL?
  public let role: UserRole?

  public init(id: UUID?, email: String?, firstName: String, lastName: String?, phoneNumber: String?, imageURL: String?, role: UserRole?) {
    self.id = id
    self.email = email
    self.firstName = firstName
    self.lastName = lastName
    self.phoneNumber = phoneNumber
    self.role = role

    if
      let imageURL,
      let imageURL = URL(string: imageURL) {
      self.imageURL = imageURL
    } else {
      self.imageURL = nil
    }
  }

  public static func initForAnother(firstName: String,
                                    imageURL: String?) -> UserDTO {
    .init(id: nil,
          email: nil,
          firstName: firstName,
          lastName: nil,
          phoneNumber: nil,
          imageURL: imageURL,
          role: nil)
  }
}
