//  Created by Igor Sorokin

public struct MeRequest: MURequest, TokenAuthenticated {
  public typealias Success = MeResponse

  public static let url = "me"
  public static let roles: Set<UserRole> = .all

  public init() {}
}

public struct MeResponse: ServerResponse {
  public let token: String
  public let user: UserDTO

  public init(token: String, user: UserDTO) {
    self.token = token
    self.user = user
  }
}
