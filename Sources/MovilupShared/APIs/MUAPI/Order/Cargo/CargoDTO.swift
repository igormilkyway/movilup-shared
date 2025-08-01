//  Created by Igor Sorokin

import struct Foundation.UUID

public struct CargoDTO: DTOType {
  public static let url = "cargo"

  public let id: UUID
  public var photos: [CargoPhotoDTO]
  public var items: [CargoItemDTO]
  public var containsHeavyItems: Bool
  public var requiresFurnitureAssembly: Bool

  public init(id: UUID,
              photos: [CargoPhotoDTO],
              items: [CargoItemDTO],
              containsHeavyItems: Bool,
              requiresFurnitureAssembly: Bool) {
    self.id = id
    self.photos = photos
    self.items = items
    self.containsHeavyItems = containsHeavyItems
    self.requiresFurnitureAssembly = requiresFurnitureAssembly
  }

  public var isValid: Bool {
    !photos.isEmpty
  }

  public var cost: Int {
    items
      .map { $0.cost }
      .reduce(0, +)
  }
}
