//  Created by Igor Sorokin

public struct CargoDTO: Codable, Sendable {
  public var photos: [CargoPhotoDTO]
  public var items: [CargoItemDTO]

  public init(photos: [CargoPhotoDTO], items: [CargoItemDTO]) {
    self.photos = photos
    self.items = items
  }

  public var isValid: Bool {
    !photos.isEmpty
  }
}
