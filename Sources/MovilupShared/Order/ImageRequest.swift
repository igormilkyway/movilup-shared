//

import Foundation

public struct ImageRequest: ServerRequest {
  public typealias Response = ImageResponse
  public static let url = "image"

  public let imageUUID: UUID
}

public struct ImageResponse: ServerResponse {
  public let imageData: Data?
}

