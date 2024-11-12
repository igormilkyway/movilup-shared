//  Created by Igor Sorokin

import Foundation

public struct OrderRequest: AuthenticatingServerRequest {
  public typealias Response = OrderResponse
  public static let url = "order"
  public static let authentication: ServerRequestAuthentication = .token

  public let id: UUID

  public init(id: UUID) {
    self.id = id
  }
}
