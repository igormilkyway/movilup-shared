//

import struct Foundation.URL
import struct Foundation.UUID

public struct MeResponse: ServerResponse {
  public let id: UUID
  public let email: String
  public let auth: UserAuth
  public let firstName: String
  public let lastName: String?
  public let phoneNumber: String?
  public let imageURL: URL?

  public init(id: UUID, email: String, auth: UserAuth, firstName: String, lastName: String?, phoneNumber: String?, imageURL: String?) {
    self.id = id
    self.email = email
    self.auth = auth
    self.firstName = firstName
    self.lastName = lastName
    self.phoneNumber = phoneNumber

    if
      let imageURL,
      let imageURL = URL(string: imageURL) {
      self.imageURL = imageURL
    } else {
      self.imageURL = nil
    }
  }
}
