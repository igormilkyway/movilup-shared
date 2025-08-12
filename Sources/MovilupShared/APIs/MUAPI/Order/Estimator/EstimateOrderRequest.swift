//  Created by Igor Sorokin

public struct EstimateOrderRequest<API: APIProtocol, Authenticator: TokenAuthenticatorProtocol>: MURequest, TokenHeaderAuthenticatedRequest {
  public typealias Success = OrderDTO

  public static var url: String { "estimate_order" }
  public static var roles: Set<UserRole> { [.estimator] }

  public let cargoItems: [CargoItemDTO]

  public init(cargoItems: [CargoItemDTO]) {
    self.cargoItems = cargoItems
  }
}
