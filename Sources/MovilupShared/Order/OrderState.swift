//

public enum OrderState: String, Codable, Sendable {
  public var intValue: Int {
    switch self {
      case .created:
        0
      case .takenByEstimator:
        1
      case .estimated:
        2
      case .approved:
        3
      case .takenByDriver:
        4
      case .arrivedAtDeparture:
        5
      case .loaded:
        6
      case .arrivedAtDestination:
        7
      case .closed:
        8
    }
  }

  case created
  case takenByEstimator
  case estimated
  case approved
  case takenByDriver
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
        self = .takenByDriver
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
