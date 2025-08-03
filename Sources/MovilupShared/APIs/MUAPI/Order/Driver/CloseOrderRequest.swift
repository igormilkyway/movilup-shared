//

public struct CloseOrderRequest: MURequest, TokenAuthenticated {
  public typealias Success = OrderDTO

  public static let url = "close_order"
  public static let roles: Set<UserRole> = [.driver, .demoDriver]

  public init() {}
}
