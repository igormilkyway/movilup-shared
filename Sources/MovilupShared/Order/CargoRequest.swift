//  Created by Igor Sorokin

import Foundation

public struct CargoRequest: ServerRequest {
  public typealias Response = CargoResponse
  
  public static let url = "cargo"

  public let orderID: UUID

  public init(orderID: UUID) {
    self.orderID = orderID
  }
}

public typealias CargoResponse = CargoDTO
extension CargoResponse: ServerResponse {}
