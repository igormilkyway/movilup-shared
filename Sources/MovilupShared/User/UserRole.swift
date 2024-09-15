//  Created by Igor Sorokin

public enum UserRole: String, Codable, Sendable {
  case owner
  case customer
  case estimator
  case driver

  public var intValue: Int {
    switch self {
      case .customer:
        0
      case .driver:
        1
      case .estimator:
        2
      case .owner:
        3
    }
  }
}
