//  Created by Igor Sorokin

import Foundation

#if canImport(FoundationNetworking)
import FoundationNetworking
#endif

public extension NSObjectProtocol {
//extension NSObjectProtocol {
  func with(_ closure: (Self) -> Void) -> Self {
    closure(self)
    return self
  }
}

//extension AnyClass {
//  func with(_ closure: (Self) -> Void) -> Self {
//    closure(self)
//    return self
//  }
//}

//extension NSCopying {
//  var copy: Self {
//    copy() as! Self
//  }
//}

public protocol With: AnyObject {
  func with(_ closure: (Self) -> Void) -> Self
}

public extension With { //} where Self: AnyObject {
  func with(_ closure: (Self) -> Void) -> Self {
    closure(self)
    return self
  }
}

public protocol ValueWith {
  func with(_ closure: (inout Self) -> Void) -> Self
}

public extension ValueWith {
  func with(_ closure: (inout Self) -> Void) -> Self {
    var s = self
    closure(&s)
    return s
  }

  func with(_ closure: (inout Self) throws -> Void) rethrows -> Self {
    var s = self
    try closure(&s)
    return s
  }
}

extension JSONEncoder: With { }
extension JSONDecoder: With { }

extension Date.FormatStyle: ValueWith {}
extension Calendar: ValueWith {}
extension Locale: ValueWith {}
extension CharacterSet: ValueWith {}
extension URLRequest: ValueWith {}
extension URLComponents: ValueWith {}
extension Set: ValueWith {}

public extension AsyncSequence {
  func forEach(_ body: (Element) async throws -> Void) async throws {
    for try await element in self {
      try await body(element)
    }
  }
}

public extension URLSession {
  static var stream: URLSession {
    .init(configuration: URLSessionConfiguration.default.with {
      $0.timeoutIntervalForRequest = .infinity
    })
  }
}

public extension UUID {
  static var mock: UUID {
    .init()
  }
}
