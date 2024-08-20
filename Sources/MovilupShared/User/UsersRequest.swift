//

public typealias UsersResponse = [UserDTO]

public struct UsersRequest: ServerRequest {
  public typealias Response = UsersResponse
  public static let url = "users"

  public let role: UserRole?

  public init(_ role: UserRole?) {
    self.role = role
  }
}
