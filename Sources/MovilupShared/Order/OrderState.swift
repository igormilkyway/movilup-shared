//

public enum OrderState: String, Codable, Sendable {
  public var intValue: Int {
    switch self {
      case .created:
        0
      case .estimated:
        1
      case .approved:
        2
      case .driverTaken:
        3
      case .arrivedAtDeparture:
        4
      case .loaded:
        5
      case .arrivedAtDestination:
        6
      case .closed:
        7
    }
  }

  case created
  case estimated
  case approved
  case driverTaken
  case arrivedAtDeparture
  case loaded
  case arrivedAtDestination
  case closed
}

extension OrderState: Comparable {
  public static func < (lhs: OrderState, rhs: OrderState) -> Bool {
    lhs.intValue < rhs.intValue
  }
}
