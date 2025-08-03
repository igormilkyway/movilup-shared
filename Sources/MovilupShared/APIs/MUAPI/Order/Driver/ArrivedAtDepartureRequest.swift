//

public struct ArrivedAtDepartureRequest: MURequest, TokenAuthenticated {
  public typealias Success = OrderDTO

  public static let url = "arrived_at_departure"
  public static let roles: Set<UserRole> = [.driver, .demoDriver]

  public init() {}
}
