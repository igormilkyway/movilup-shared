//  Created by Igor Sorokin

import CoreGraphics
import SwiftUI

extension NSObjectProtocol {
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

extension NSCopying {
  var copy: Self {
    copy() as! Self
  }
}

protocol With {
  func with(_ closure: (Self) -> Void) -> Self
}

extension With {
  func with(_ closure: (Self) -> Void) -> Self {
    closure(self)
    return self
  }
}

protocol ValueWith {
  func with(_ closure: (inout Self) -> Void) -> Self
}

extension ValueWith {
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

extension Date.FormatStyle: ValueWith {}
extension Transaction: ValueWith {}
extension Calendar: ValueWith {}
extension Locale: ValueWith {}
extension CharacterSet: ValueWith {}
extension URLRequest: ValueWith {}
extension URLComponents: ValueWith {}

//final public class CGSizeClass {
//  public var width: CGFloat
//  public var height: CGFloat
//
//  public init(cgSize: CGSize) {
//    width = cgSize.width
//    height = cgSize.height
//  }
//}
//
//extension CGSize {
//  init(cgSizeClass: CGSizeClass) {
//    self.init(width: cgSizeClass.width, height: cgSizeClass.height)
//  }
//
//  func withCopy(_ closure: (CGSizeClass) -> Void) -> CGSize {
//    let cgSizeClass = CGSizeClass(cgSize: self)
//    closure(cgSizeClass)
//    return CGSize(cgSizeClass: cgSizeClass)
//  }
//}
//
//public final class CGPointClass {
//  public var x: CGFloat
//  public var y: CGFloat
//
//  public init(cgPoint: CGPoint) {
//    x = cgPoint.x
//    y = cgPoint.y
//  }
//}
//
//extension CGPoint {
//  init(cgPointClass: CGPointClass) {
//    self.init(x: cgPointClass.x, y: cgPointClass.y)
//  }
//
//  func withCopy(_ closure: (CGPointClass) -> Void) -> CGPoint {
//    let cgPointClass = CGPointClass(cgPoint: self)
//    closure(cgPointClass)
//    return CGPoint(cgPointClass: cgPointClass)
//  }
//}
//
//extension Set {
//  func withCopy(_ closure: (NSMutableSet) -> Void) -> Set {
//    let setClass = NSMutableSet(set: self)
//    closure(setClass)
//    return setClass as! Set
//  }
//}
