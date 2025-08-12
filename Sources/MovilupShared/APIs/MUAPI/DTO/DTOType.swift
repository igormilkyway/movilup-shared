//

import struct Foundation.UUID

public protocol DTOType: ServerResponse, Identifiable, RoleAuthenticatedRequest {
  static var url: String { get }

  var id: UUID { get }
}

extension DTOType {
  public static var roles: Set<UserRole> { .all }
}
