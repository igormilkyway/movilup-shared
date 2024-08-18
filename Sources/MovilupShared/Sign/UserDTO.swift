//

import struct Foundation.URL
import struct Foundation.UUID

public struct UserDTO: ServerResponse {
  var id: UUID?
  var email: String
  var passwordHash: String
  var firstName: String
  var lastName: String
  var phoneNumber: String
  var imageURL: URL?

  public init(id: UUID? = nil, email: String, passwordHash: String, firstName: String, lastName: String, phoneNumber: String, imageURL: URL? = nil) {
    self.id = id
    self.email = email
    self.passwordHash = passwordHash
    self.firstName = firstName
    self.lastName = lastName
    self.phoneNumber = phoneNumber
    self.imageURL = imageURL
  }
}
