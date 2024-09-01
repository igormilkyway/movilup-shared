//

public struct CargoItemDTO: Codable, Sendable {
  public var name: String
  public var price: Int
  public var quantity: Int

  public init(name: String, price: Int, quantity: Int) {
    self.name = name
    self.price = price
    self.quantity = quantity
  }
}
