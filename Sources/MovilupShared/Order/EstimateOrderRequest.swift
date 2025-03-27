//  Created by Igor Sorokin

public struct EstimateOrderRequest: TokenAuthenticatingServerRequest {
  public typealias Success = OrderDTO

  public static let url = "estimate_order"
  public static let roles: [UserRole] = [.estimator]

  public let cargoItems: [CargoItemDTO]

  public init(cargoItems: [CargoItemDTO]) {
    self.cargoItems = cargoItems
  }
}
