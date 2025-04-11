//

import Foundation

public protocol DTOType: ServerSuccess {
  static var url: String { get }

  var id: UUID? { get }
}
