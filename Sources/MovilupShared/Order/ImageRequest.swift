//  Created by Igor Sorokin

import Foundation

public struct ImageRequest: AuthenticatingServerRequest {
  public typealias Response = ImageResponse
  public static let url = "image"
  public static let authentication: ServerRequestAuthentication = .token

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

