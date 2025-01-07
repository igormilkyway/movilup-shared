//  Created by Igor Sorokin

public struct UpdateDriverNeedsLoadersRequest: AuthenticatingServerRequest {
  public static let url = "update-driver-needs-loaders"
  public static let roles: [UserRole] = [.driver]

  public let needsLoaders: Bool

  public init(needsLoaders: Bool) {
    self.needsLoaders = needsLoaders
  }
}
