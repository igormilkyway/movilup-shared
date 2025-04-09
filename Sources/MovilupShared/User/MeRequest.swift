//  Created by Igor Sorokin

public struct MeRequest: TokenAuthenticatingServerRequest {
  public typealias Success = MeResponse

  public static let url = "me"

  public init() {}
}

public struct MeResponse: ServerSuccess {
  public let token: String
  public let user: UserDTO

  public init(token: String, user: UserDTO) {
    self.token = token
    self.user = user
  }
}
