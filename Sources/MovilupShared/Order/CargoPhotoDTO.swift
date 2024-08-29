//

import Foundation

public struct CargoPhotoDTO: Codable {
  public let itemIdentifier: String
  public let imageData: Data

  public init(itemIdentifier: String, imageData: Data) {
    self.itemIdentifier = itemIdentifier
    self.imageData = imageData
  }
}
