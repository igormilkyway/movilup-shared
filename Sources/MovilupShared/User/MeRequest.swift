//  Created by Igor Sorokin

public struct MeRequest: AuthenticatingServerRequest {
  public typealias Response = MeResponse
  public static let url = "me"
  public static let authentication: ServerRequestAuthentication = .token

  public init() {}
}

public struct MeResponse: Codable, Sendable {
  public let token: String
  public let usersResponseElement: UserResponse

  public init(token: String, usersResponseElement: UserResponse) {
    self.token = token
    self.usersResponseElement = usersResponseElement
  }
}
