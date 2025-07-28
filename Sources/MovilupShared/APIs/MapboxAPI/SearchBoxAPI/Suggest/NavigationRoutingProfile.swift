//

import Foundation

/// Available profiles are: driving, walking, and cycling.
public enum NavigationRoutingProfile: String, LosslessStringConvertible, Codable, Sendable {
  /// For automotive routing. This profile factors in current and historic traffic conditions to avoid slowdowns. Traffic information is available for the supported geographies listed in our Traffic Data page. Requests using this profile accept up to 25 coordinates.
  /// Matrix API: Car travel times, distances, or both as informed by traffic data. The maximum is 10 coordinates.
  /// - Maximum 10 input coordinates per request
  /// - Maximum 30 requests per minute
  case drivingTraffic

  /// For automotive routing. This profile shows the fastest routes by preferring high-speed roads like highways. Requests using this profile accept up to 25 coordinates.
  /// Matrix API: Car travel times, distances, or both.
  /// - Maximum 25 input coordinates per request
  /// - Maximum 60 requests per minute
  case driving

  /// For bicycle routing. This profile shows routes that are short and safer for cyclists by avoiding highways and preferring streets with bike lanes. Requests using this profile accept up to 25 coordinates.
  /// Matrix API: Bicycle travel times, distances, or both
  /// - Maximum 25 input coordinates per request
  /// - Maximum 60 requests per minute

  case cycling

  /// For pedestrian and hiking routing. This profile shows the optimal path by using sidewalks and trails. Requests using this profile accept up to 25 coordinates.
  /// Matrix API: Pedestrian and hiking travel times, distances, or both
  /// - Maximum 25 input coordinates per request
  /// - Maximum 60 requests per minute
  case walking

//  var value: String {
//    switch self {
//      case .drivingTraffic:
//        "driving-traffic"
//      case .driving:
//        "driving"
//      case .cycling:
//        "cycling"
//      case .walking:
//        "walking"
//    }
//  }
}
