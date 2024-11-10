//  Created by Igor Sorokin

import Foundation

public typealias UsersResponse = [UserResponse]

public struct UsersRequest: AuthenticatingServerRequest {
  public typealias Response = UsersResponse
  public static let url = "users"
  public static let authentication: ServerRequestAuthentication = .muToken

  public let role: UserRole?

  public init(role: UserRole?) {
    self.role = role
  }
}
