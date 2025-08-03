//  Created by Igor Sorokin

public struct EstimateOrderRequest: MURequest, TokenAuthenticated {
  public typealias Success = OrderDTO

  public static let url = "estimate_order"
  public static let roles: Set<UserRole> = [.estimator]

  public let cargoItems: [CargoItemDTO]

  public init(cargoItems: [CargoItemDTO]) {
    self.cargoItems = cargoItems
  }
}
