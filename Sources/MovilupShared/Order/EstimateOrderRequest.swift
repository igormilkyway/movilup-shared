//  Created by Igor Sorokin

import struct Foundation.UUID

public struct EstimateOrderRequest: ServerRequest {
  public typealias Response = OrderResponse
  public static let url = "estimate_order"

  public let cargoItems: [CargoItemDTO]

  public init(cargoItems: [CargoItemDTO]) {
    self.cargoItems = cargoItems
  }
}
