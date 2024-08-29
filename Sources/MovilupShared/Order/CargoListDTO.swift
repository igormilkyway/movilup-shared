//

public struct CargoListDTO: Codable {
  public var items: [CargoListItemDTO]

  public init(items: [CargoListItemDTO]) {
    self.items = items
  }
}
