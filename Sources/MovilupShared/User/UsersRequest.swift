//  Created by Igor Sorokin

public typealias UsersResponse = [UserResponse]

public struct UsersRequest: AuthenticatingServerRequest {
  public typealias Success = UsersResponse

  public static let url = "users"
  public static let roles: [UserRole] = [.owner, .loader]

  public let role: UserRole?

  public init(role: UserRole?) {
    self.role = role
  }
}
