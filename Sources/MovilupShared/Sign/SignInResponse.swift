//


public struct SignInResponse: ServerResponse {
  public var token: String

  public init(token: String) {
    self.token = token
  }
}
