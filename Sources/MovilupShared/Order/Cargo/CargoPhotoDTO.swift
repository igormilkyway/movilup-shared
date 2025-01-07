//  Created by Igor Sorokin

import struct Foundation.UUID
import struct Foundation.Data

public struct CargoPhotoDTO: Codable, Sendable {
  public let id: UUID?
  public let itemIdentifier: String
  public var imageData: Data?
  public let imageUUID: UUID?

  public init(id: UUID? = nil, itemIdentifier: String, imageData: Data?, imageUUID: UUID?) {
    self.id = id
    self.itemIdentifier = itemIdentifier
    self.imageData = imageData
    self.imageUUID = imageUUID
  }
}
