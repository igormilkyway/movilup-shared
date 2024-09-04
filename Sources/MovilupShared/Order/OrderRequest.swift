//

import Foundation

public struct OrderRequest: ServerRequest {
  public typealias Response = OrdersResponseElement
  public static let url = "order"

  public let id: UUID

  public init(id: UUID) {
    self.id = id
  }
}
