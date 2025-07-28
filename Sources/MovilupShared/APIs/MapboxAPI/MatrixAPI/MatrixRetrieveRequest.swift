//

extension CodingUserInfoKey {
  static let httpStatusCode: CodingUserInfoKey = CodingUserInfoKey(rawValue: "com.movil-up.ios.decoder.httpStatusCode")!
}

/// https://api.mapbox.com/directions-matrix/v1/{profile}/{coordinates}
struct MatrixRetrieveRequest: MatrixRequest {
  typealias Response = MatrixRetrieveResponse

  static let url = "mapbox"

  @AssertNotEmpry public var accessToken: String = Self.accessToken

  var path: String {
    "/\(profile)/\(coordinates)"
  }

  /// A Mapbox Directions routing profile ID.
  /// String
  let profile: NavigationRoutingProfile // = .driving

  /// number
  /// A semicolon-separated list of {longitude},{latitude} coordinates.
  /// There must be between 2 and 25 coordinates.
  /// -122.42,37.78;-122.45,37.91;-122.48,37.73
  /// source;destination;destination
  var coordinates: String // = ""

  /// Used to specify the resulting matrices. Possible values are: duration (default), distance, or both values separated by a comma.
  let annotations: String?

  /// A semicolon-separated list indicating the side of the road from which to approach waypoints in a requested route. Accepts unrestricted (default, route can arrive at the waypoint from either side of the road) or curb (route will arrive at the waypoint on the driving_side of the region). If provided, the number of approaches must be the same as the number of waypoints. But, you can skip a coordinate and show its position in the list with the ; separator.
  var approaches: String?

  /// sources=0;2&destinations=all
  /// integer or string
  /// Use the coordinates at a given index as sources. Possible values are: a semicolon-separated list of 0-based indices, or all (default). The option all allows using all coordinates as sources.
  var sources: [Int]?

  /// integer or string
  /// Use the coordinates at a given index as destinations. Possible values are: a semicolon-separated list of 0-based indices, or all (default). The option all allows using all coordinates as destinations.
  var destinations: [Int]?

  ///  LEGACY
  ///  integer
  ///  By default, if there is no possible route between 2 points, the Matrix API sets the resulting matrix element to null.
  ///  To circumvent this behavior, set the `fallback_speed` parameter to a value greater than 0 in kilometers per hour.
  ///  The Matrix API will replace a null value with a straight-line estimate between the source and destination based on the provided speed value.
  let fallbackSpeed: Int = 50

  enum CodingKeys: String, CodingKey {
    case accessToken = "access_token"

    case annotations
    case approaches
    case sources
    case destinations
    case fallbackSpeed = "fallback_speed"
  }
}

//extension MatrixRequest {
//  func encode(to encoder: any Encoder) throws {
//    guard let accessToken = Self.accessToken else {
//      throw SendError.noCredentials
//    }
//
//    var container = encoder.container(keyedBy: CodingKeys.self)
//
//    try container.encode(accessToken, forKey: .accessToken)
//
//    try container.encodeIfPresent(annotations, forKey: .annotations)
//    try container.encodeIfPresent(approaches, forKey: .approaches)
//    try container.encodeIfPresent(sources, forKey: .sources)
//    try container.encodeIfPresent(destinations, forKey: .destinations)
//  }
//}
