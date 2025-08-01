//  Created by Igor Sorokin

public enum UserRole: String, Codable, Sendable {
  case owner
  case customer
  case demoCustomer
  case estimator
  case demoEstimator
  case driver
  case demoDriver
  case loader
}

extension UserRole: CaseIterable {
//  public static var allCases: [UserRole] {
//    [.owner,
//     .customer,
//     .estimator,
//     .driver,
//     .loader]
//  }
}

extension Set where Element == UserRole {
  static var all: Self {
    UserRole.allCases.toSet()
  }
}
