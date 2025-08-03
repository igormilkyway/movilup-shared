//

public struct ArrivedAtDestinationRequest: MURequest, TokenAuthenticated {
  public typealias Success = OrderDTO

  public static let url = "arrived_at_destination"
  public static let roles: Set<UserRole> = [.driver, .demoDriver]

  public init() {}
}
