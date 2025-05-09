//  Created by Igor Sorokin

import Foundation

public struct DTORequest<DTO: DTOType>: TokenAuthenticatingServerRequest, PostRequest {
  public typealias Success = DTO

  public static var url: String { DTO.url }

  public let id: UUID

  public init(id: UUID) {
    self.id = id
  }
}
