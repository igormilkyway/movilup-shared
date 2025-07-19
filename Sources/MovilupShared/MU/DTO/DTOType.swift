//

import Foundation

public protocol DTOType: ServerResponse {
  static var url: String { get }

  var id: UUID? { get }
}
