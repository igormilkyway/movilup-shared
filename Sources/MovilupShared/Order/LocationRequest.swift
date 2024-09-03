//

import Foundation

public struct LocationRequest: ServerRequest {
  public typealias Response = LocationResponse
  public static let url = "location"

  public let id: UUID

  public init(id: UUID) {
    self.id = id
  }
}

public typealias LocationResponse = LocationDTO
extension LocationResponse: ServerResponse {}
