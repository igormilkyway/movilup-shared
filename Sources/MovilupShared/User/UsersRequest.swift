//

import Foundation

public typealias UsersResponse = [UserResponse]

public struct UsersRequest: ServerRequest {
  public typealias Response = UsersResponse
  public static let url = "users"

  public let role: UserRole?

  public init(role: UserRole?) {
    self.role = role
  }
}
