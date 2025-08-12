//  Created by Igor Sorokin

import Foundation

public struct DTORequest<DTO: DTOType, API: APIProtocol, Authenticator: TokenAuthenticatorProtocol>: MURequest, TokenHeaderAuthenticatedRequest {
  public typealias Success = DTO

  public static var url: String { DTO.url }
  public static var roles: Set<UserRole> {
    DTO.roles
  }

  public let id: UUID

  public init(id: UUID) {
    self.id = id
  }
}
