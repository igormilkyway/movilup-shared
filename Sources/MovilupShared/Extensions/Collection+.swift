//

public extension Collection {
  subscript (safe index: Index) -> Element? {
    indices.contains(index) ? self[index] : nil
  }

//  subscript(safe index: Self.Index) -> Element? {
//    if index >= startIndex && index < endIndex {
//      self[index]
//    } else {
//      nil
//    }
//  }
}

public extension Collection where Element: Hashable {
  func unique() -> [Element] {
    Array(toSet())
  }

  func toSet() -> Set<Element> {
    Set(self)
  }
}

public extension Collection where Element == Character {
  func toString() -> String {
    String(self)
  }
}
