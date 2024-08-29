//

import Foundation

public typealias UsersResponse = [UsersResponseElement]

public struct UsersRequest: ServerRequest {
  public typealias Response = UsersResponse
  public static let url = "users"

  public let role: UserRole?

  public init(_ role: UserRole?) {
    self.role = role
  }
}

public struct UsersResponseElement: Codable {
  let id: UUID
  let email: String
  let firstName: String
  let lastName: String?
  let phoneNumber: String?
  let imageData: Data?
  let isOnLine: Bool

  public init(id: UUID, email: String, firstName: String, lastName: String?, phoneNumber: String?, imageData: Data?, isOnLine: Bool) {
    self.id = id
    self.email = email
    self.firstName = firstName
    self.lastName = lastName
    self.phoneNumber = phoneNumber
    self.imageData = imageData
    self.isOnLine = isOnLine
  }
}
