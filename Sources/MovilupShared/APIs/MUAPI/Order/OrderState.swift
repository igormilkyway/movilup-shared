//  Created by Igor Sorokin

public enum OrderState: String, Codable, Sendable {
  case created
  case takenByEstimator
  case estimated
  case approved
  case takenByDriver
  case arrivedAtDeparture
  case loaded
  case arrivedAtDestination
  case closed
}

public extension OrderState {
  var intValue: Int {
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

  init?(intValue: Int) {
    switch intValue {
      case 0:
        self = .created
      case 1:
        self = .takenByEstimator
      case 2:
        self = .estimated
      case 3:
        self = .approved
      case 4:
        self = .takenByDriver
      case 5:
        self = .arrivedAtDeparture
      case 6:
        self = .loaded
      case 7:
        self = .arrivedAtDestination
      case 8:
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

extension OrderState: CaseIterable {
  public static var allCases: [OrderState] {
    [.created,
     .takenByEstimator,
     .estimated,
     .approved,
     .takenByDriver,
     .arrivedAtDeparture,
     .loaded,
     .arrivedAtDestination,
     .closed]
  }
}
