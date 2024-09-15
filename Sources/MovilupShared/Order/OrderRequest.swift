//  Created by Igor Sorokin

import Foundation

public struct OrderRequest: ServerRequest {
  public typealias Response = OrderResponse
  public static let url = "order"

  public let id: UUID

  public init(id: UUID) {
    self.id = id
  }
}
