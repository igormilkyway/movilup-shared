//  Created by Igor Sorokin

public struct MeRequest: AuthenticatingServerRequest {
  public typealias Success = MeResponse

  public static let url = "me"

  public init() {}
}

public struct MeResponse: ServerSuccess {
  public let token: String
  public let usersResponseElement: UserResponse

  public init(token: String, usersResponseElement: UserResponse) {
    self.token = token
    self.usersResponseElement = usersResponseElement
  }
}
