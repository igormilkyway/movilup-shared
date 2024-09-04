//

import Foundation

public typealias UsersResponse = [UsersResponseElement]

public struct UsersRequest: ServerRequest {
  public typealias Response = UsersResponse
  public static let url = "users"

  public let role: UserRole?

  public init(role: UserRole?) {
    self.role = role
  }
}

public struct UsersResponseElement: ServerResponse {
  public let id: UUID
  public let email: String
  public let firstName: String
  public let lastName: String?
  public let phoneNumber: String?
  public let imageData: Data?
  public let role: UserRole
  public var isOnLine: Bool

  public init(id: UUID, 
              email: String,
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
