//  Created by Igor Sorokin

public struct UpdateDriverNeedsLoadersRequest: MURequest, TokenAuthenticated {
  public static let url = "update-driver-needs-loaders"
  public static let roles: Set<UserRole> = [.driver]

  public let needsLoaders: Bool

  public init(needsLoaders: Bool) {
    self.needsLoaders = needsLoaders
  }
}
