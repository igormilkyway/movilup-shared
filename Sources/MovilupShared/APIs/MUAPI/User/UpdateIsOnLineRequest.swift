//  Created by Igor Sorokin

public struct UpdateIsOnLineRequest: MURequest, TokenAuthenticated {
  public static let url = "update-isonline"
  public static let roles: Set<UserRole> = [.driver]

  public let isOnLine: Bool

  public init(isOnLine: Bool) {
    self.isOnLine = isOnLine
  }
}
