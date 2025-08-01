//  Created by Igor Sorokin

import struct Foundation.UUID
import struct Foundation.Data

public struct CargoPhotoDTO: DTOType {
  public static let url = "cargo_photo"

  public let id: UUID
  public let itemIdentifier: String
  public var imageData: Data?

  public init(id: UUID, itemIdentifier: String, imageData: Data?) {
    self.id = id
    self.itemIdentifier = itemIdentifier
    self.imageData = imageData
  }
}
