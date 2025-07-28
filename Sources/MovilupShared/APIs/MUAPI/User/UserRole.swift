//  Created by Igor Sorokin

public enum UserRole: String, Codable, Sendable {
  case owner
  case customer
  case estimator
  case driver
  case loader
}

extension UserRole: CaseIterable {
  public static var allCases: [UserRole] {
    [.owner,
     .customer,
     .estimator,
     .driver,
     .loader]
  }
}
