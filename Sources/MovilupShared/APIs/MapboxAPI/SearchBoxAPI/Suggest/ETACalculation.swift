//

import Foundation

public struct ETACalculation: Codable, Sendable {
  static let etaValue = "navigation"

  let eta: String

  /// The navigation routing profile to use.
  /// When ETA calculation is enabled, the navigation routing profile to use. Available profiles are: driving, walking, and cycling.
  let navigationProfile: NavigationRoutingProfile

  /// suggest:
  /// - When ETA calculation is enabled, location from which to calculate distance.
  /// - Provided as 2 comma-separated coordinates in longitude,latitude order.
  /// - When both proximity and origin are provided, origin is interpreted as the target of a route, while proximity indicates the current user location.
  let origin: Coordinate?

  enum CodingKeys: String, CodingKey {
    case eta = "eta_type"
    case navigationProfile = "navigation_profile"
    case origin
  }

  public init(navigationProfile: NavigationRoutingProfile = .driving, origin: Coordinate? = nil) {
    self.eta = Self.etaValue
    self.navigationProfile = navigationProfile
    self.origin = origin
  }
}
