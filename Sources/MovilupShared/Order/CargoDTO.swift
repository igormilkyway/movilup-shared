//

public struct CargoDTO: Codable, Sendable {
  public var photos: [CargoPhotoDTO]
  public var items: [CargoItemDTO]

  public init(photos: [CargoPhotoDTO], items: [CargoItemDTO]) {
    self.photos = photos
    self.items = items
  }
}
