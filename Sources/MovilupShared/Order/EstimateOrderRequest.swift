//  Created by Igor Sorokin

import struct Foundation.UUID

public struct EstimateOrderRequest: AuthenticatingServerRequest {
  public typealias Response = OrderResponse
  public static let url = "estimate_order"
  public static let authentication: ServerRequestAuthentication = .muToken

  public let cargoItems: [CargoItemDTO]

  public init(cargoItems: [CargoItemDTO]) {
    self.cargoItems = cargoItems
  }
}
