//  Created by Igor Sorokin

public struct UpdateIsOnLineRequest: TokenAuthenticatingServerRequest {
  public static let url = "update-isonline"

  public let isOnLine: Bool

  public init(isOnLine: Bool) {
    self.isOnLine = isOnLine
  }
}
