//  Created by Igor Sorokin

import struct Foundation.UUID
import struct Foundation.Data

public struct ImageRequest: MURequest, TokenAuthenticated  {
  public typealias Success = ImageResponse

  public static let url = "image"
  
  public let imageUUID: UUID

  public init(imageUUID: UUID) {
    self.imageUUID = imageUUID
  }
}

public struct ImageResponse: ServerResponse {
  public let imageData: Data

  public init(imageData: Data) {
    self.imageData = imageData
  }
}

