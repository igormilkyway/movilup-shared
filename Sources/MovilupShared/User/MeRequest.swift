//

public struct MeRequest: ServerRequest {
  public typealias Response = MeResponse
  public static let url = "me"

  public init() {}
}

public struct MeResponse: ServerResponse {
  public let token: String
  public let usersResponseElement: UsersResponseElement

  public init(token: String, usersResponseElement: UsersResponseElement) {
    self.token = token
    self.usersResponseElement = usersResponseElement
  }
}
