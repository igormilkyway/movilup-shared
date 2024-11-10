//  Created by Igor Sorokin

public struct UpdateIsOnLineRequest: AuthenticatingServerRequest {
  public typealias Response = EmptyServerResponse
  public static let url = "update-isonline"
  public static let authentication: ServerRequestAuthentication = .muToken

  public let isOnLine: Bool

  public init(isOnLine: Bool) {
    self.isOnLine = isOnLine
  }
}
