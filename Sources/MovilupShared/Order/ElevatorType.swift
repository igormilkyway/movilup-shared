//  Created by Igor Sorokin

public enum ElevatorType: String, Codable, Sendable {
  case none
  case passenger
  case freight
}

extension ElevatorType: CaseIterable {
  public static var allCases: [ElevatorType] {
    [.none,
     .passenger,
     .freight]
  }
}
