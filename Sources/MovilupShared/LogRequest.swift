//  Created by Igor Sorokin

public struct LogRequest: MURequest, TokenAuthenticated {
  public typealias Success = LogResponse

  public static let url = "log"
  public static let roles: Set<UserRole> = .all

  let message: String

  public init(message: String) {
    self.message = message
  }
}

public struct LogResponse: ServerResponse {

}
