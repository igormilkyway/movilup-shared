//

import Foundation

protocol Unwrapped {
  var unwrapped: String { get }
}

extension String: Unwrapped {
  var unwrapped: String {
    "\(self)"
  }
}

extension Suggestion: Unwrapped {
  var unwrapped: String {
    "\(name)"
  }
}

extension Optional where Wrapped == Unwrapped {
  var unwrapped: String {
    switch self {
      case .none:
        "nil"
      case .some(let wrapped):
        wrapped.unwrapped
    }
  }
}

public extension Optional where Wrapped: RawRepresentable<String> {
  var unwrapped: String {
    "\(self != nil ? self!.rawValue : "nil")"
  }
}

extension Optional where Wrapped: CustomStringConvertible {
  var unwrapped: String {
    "\(self != nil ? self!.description : "nil")"
  }
}
