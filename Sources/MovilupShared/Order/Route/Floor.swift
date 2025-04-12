//

import Foundation

extension LocationDTO {
  public enum Floor: Equatable, Codable, Sendable {
    case number(Int)
    case higher

    public var cost: Int {
      switch self {
        case .number(let number):
          if number > 3 {
            number * 50
          } else {
            0
          }
        case .higher:
          (30 - 3 + 1) * 50
      }
    }
  }
}

extension LocationDTO.Floor: @retroactive RawRepresentable {
  public var rawValue: String {
    switch self {
      case .number(let number):
        String(number)
      case .higher:
        "> 30"
    }
  }

  public init?(rawValue: String) {
    if rawValue == "> 30" {
      self = .higher
    } else if let rawNumber = Int(rawValue) {
      switch rawNumber {
        case 1...30:
          self = .number(rawNumber)
        default:
          return nil
      }
    } else {
      return nil
    }
  }
}

extension LocationDTO.Floor: CaseIterable {
  public static var allCases: [LocationDTO.Floor] {
    let numbers = Array(1...30)
      .map {
        Self.number($0)
      }

    return numbers + [.higher]
  }
}
