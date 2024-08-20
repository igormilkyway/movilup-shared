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

  public init?(intValue: Int) {
    switch intValue {
      case 0:
        self = .created
      case 1:
        self = .estimated
      case 2:
        self = .approved
      case 3:
        self = .driverTaken
      case 4:
        self = .arrivedAtDeparture
      case 5:
        self = .loaded
      case 6:
        self = .arrivedAtDestination
      case 7:
        self = .closed
      default:
        return nil
    }
  }
}

extension OrderState: Comparable {
  public static func < (lhs: OrderState, rhs: OrderState) -> Bool {
    lhs.intValue < rhs.intValue
  }
}
