//  Created by Igor Sorokin

import struct Foundation.UUID
import struct Foundation.Data

public struct ImageRequest<API: APIProtocol, Authenticator: TokenAuthenticatorProtocol>: MURequest, TokenHeaderAuthenticatedRequest  {
  public typealias Success = ImageResponse

  public static var url: String { "image" }
  public static var roles: Set<UserRole> { .all.subtracting([.loader]) }

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

