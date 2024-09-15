//  Created by Igor Sorokin

import Foundation

public struct CargoPhotoDTO: Codable, Sendable {
  public let itemIdentifier: String
  public var imageData: Data?
  public let imageUUID: UUID?

  public init(itemIdentifier: String, imageData: Data?, imageUUID: UUID?) {
    self.itemIdentifier = itemIdentifier
    self.imageData = imageData
    self.imageUUID = imageUUID
  }
}
