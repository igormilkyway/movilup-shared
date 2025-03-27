//  Created by Igor Sorokin

import struct Foundation.UUID

public struct CargoItemDTO: Codable, Sendable {
  public let id: UUID?
  public var name: String
  public var price: Int
  public var quantity: Int

  public init(id: UUID? = nil, name: String, price: Int, quantity: Int) {
    self.id = id
    self.name = name
    self.price = price
    self.quantity = quantity
  }

  public var cost: Int {
    price * quantity
  }
}
