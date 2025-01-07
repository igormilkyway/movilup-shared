//  Created by Igor Sorokin

import struct Foundation.UUID
import struct Foundation.Data

public struct ImageRequest: AuthenticatingServerRequest {
  public typealias Success = ImageResponse

  public static let url = "image"
  
  public let imageUUID: UUID

  public init(imageUUID: UUID) {
    self.imageUUID = imageUUID
  }
}

public struct ImageResponse: ServerSuccess {
  public let imageData: Data

  public init(imageData: Data) {
    self.imageData = imageData
  }
}

