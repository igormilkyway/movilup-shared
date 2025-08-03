//

public struct LoadedRequest: MURequest, TokenAuthenticated {
  public typealias Success = OrderDTO

  public static let url = "loaded"
  public static let roles: Set<UserRole> = [.driver, .demoDriver]

  public init() {}
}
