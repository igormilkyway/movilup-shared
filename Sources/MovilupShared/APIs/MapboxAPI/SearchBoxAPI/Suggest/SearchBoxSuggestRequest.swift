//

import Foundation
/// ///https://api.mapbox.com/search/searchbox/v1/suggest?q=Malkhei%2520Israel%2520&access_token=&session_token=3000C049-1992-4512-A5F5-C0F4BF691FBC&language=en&limit=10&bbox=33.72080106788262%252C31.17819071553516%252C35.839198932117384%252C32.98180928446484&country=US&proximity=34.78%252C32.08

/// https://api.mapbox.com/search/searchbox/v1/suggest?q={search_text}
/// $curl  "https://api.mapbox.com/search/searchbox/v1/suggest?q=Michigan%20Stadium&language=en&limit=1&session_token=[GENERATED-UUID]&proximity=-83.748708,42.265837&country=US&access_token=pk.eyJ1IjoiaWdvcm1pbGt5d2F5IiwiYSI6ImNsemhzemxhczA4YWoybXF4b3E5bnA4bDcifQ.KC7iC8G9iC9IJuftReWbZA"
public struct SearchBoxSuggestRequest: SearchBoxRequest {
  public init(language: String? = nil, text: String, boundingBox: BoundingBox, countries: Set<String>, eta: ETACalculation?, proximity: Coordinate?) {
    self.language = language
    self.text = text
    self.boundingBox = boundingBox
    self.countries = countries
    self.eta = eta
    self.proximity = proximity
  }
  
  public typealias Response = SearchBoxSuggestResponse

  public static let url = "suggest"

//  @MainActor
  nonisolated(unsafe) static var sessionToken = UUID()

//  static var sessionToken: UUID {
//    if let _sessionToken {
//      return _sessionToken
//    } else {
//      _sessionToken = UUID()
//      return _sessionToken!
//    }
//  }

  /// A customer-provided session token value, which groups a series of requests together for billing purposes. UUIDv4 is recommended.
  //  @MainActor
  let sessionToken = Self.sessionToken

  @AssertNotEmpry public var accessToken: String = Self.accessToken

  /// The ISO language code to be returned. If not provided, the default is English.
  /// Allows you to specify the language in which you would like to search.
  /// One or more languages can be specified using ISO 639-1 codes (`en`).
  /// Translation availability varies by language and region, and you can expect more consistent results for areas where the specified language is most widely used.
  let language: String?

  /// The user's query string. The query is limited to 256 characters.
  let text: String

  /// The number of results to return, up to 10.
  let limit: Int = 10

  /// Limit results to only those contained within the supplied bounding box.
  var boundingBox: BoundingBox

  /// A comma-separated list of ISO 3166 alpha 2 country codes.
  /// US
  var countries: Set<String>

  /// Limit results to one or more types of features.
  /// Pass one or more of the type names as a comma separated list.
  /// If no types are specified, all possible types may be returned.
  var types: Set<AdministrativeUnit>? = Set(AdministrativeUnit.allCases).subtracting([
    .category,
    .prefecture,
    .oaza,
    .brand,
    .block,
    .secondary_address,
    .poi,
  ])

  /// Limit results to those that belong to one or more categories, provided as a comma-separated list.
  var includedPOICategories: Set<String>?

  /// A comma-separated list of canonical category names that limits POI results to those that are not part of the given categories.
  var excludedPOICategories: Set<String>?

  /// Enable Estimate Time Arrival (ETA) calculation in the response. The only allowed value for this parameter is navigation.
  /// When this parameters is used, `navigation_profile` and either `origin` or `proximity` is also should be provided.
  /// Enabling ETA calculations will introduce additional latency and incur extra costs, as each search result for which ETAs are calculated (matrix elements) will be billed according to the Mapbox Matrix API pricing.
  let eta: ETACalculation? // isETACalculation is enabled

  /// Bias the response to favor results that are closer to a specific location. Provide either ip to get results closest to the user's IP location
  /// or provide 2 comma-separated coordinates in `longitude,latitude` order. If not provided, the default is IP proximity.
  /// When both `proximity` and `origin` are provided, `origin` is interpreted as the target of a route, while `proximity` indicates the current user location.
  let proximity: Coordinate?

  enum CodingKeys: String, CodingKey {
    case accessToken = "access_token"
    case sessionToken = "session_token"

    case text = "q"
    case language
    case limit
    case boundingBox = "bbox"
    case countries = "country"
    case types
    case includedPOICategories = "poi_category"
    case excludedPOICategories = "poi_category_exclusions"

    case proximity

    case eta = "eta_type"
    case navigationProfile = "navigation_profile"
    case origin
  }
}

public extension SearchBoxSuggestRequest {
//  init(from decoder: Decoder) throws {
//    let container = try decoder.container(keyedBy: CodingKeys.self)
//
//    text = try container.decode(String.self, forKey: .text)
//    accessToken = try container.decode(String.self, forKey: .accessToken)
//    sessionToken = try container.decode(UUID.self, forKey: .sessionToken)
//    language = try container.decodeIfPresent(String.self, forKey: .language)
//    limit = try container.decode(Int.self, forKey: .limit)
//    boundingBox = try container.decodeIfPresent(BoundingBox.self, forKey: .boundingBox)
//    countries = try container.decodeIfPresent(Set<String>.self, forKey: .countries)
//    types = try container.decodeIfPresent(Set<AdministrativeUnit>.self, forKey: .types)
//    includedPOICategories = try container.decodeIfPresent(Set<String>.self, forKey: .includedPOICategories)
//    excludedPOICategories = try container.decodeIfPresent(Set<String>.self, forKey: .excludedPOICategories)
//    proximity = try container.decodeIfPresent(CLLocationCoordinate2D.self, forKey: .proximity)
//
//    self.eta = try {
//      guard
//        let eta = try container.decodeIfPresent(String.self, forKey: .eta),
//        eta == ETACalculation.etaValue
//      else {
//        throw DecodingError.dataCorruptedError(forKey: .eta, in: container, debugDescription: "eta != \"\(ETACalculation.etaValue)\"")
//      }
//
//      let navigationProfile = try container.decode(NavigationRoutingProfile.self, forKey: .navigationProfile)
//      let origin = try container.decodeIfPresent(CLLocationCoordinate2D.self, forKey: .origin)
//
//      return ETACalculation(navigationProfile: navigationProfile, origin: origin)
//    }()
//  }

  func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)

    try container.encodeIfPresent(text, forKey: .text)
    try container.encodeIfPresent(accessToken, forKey: .accessToken)
    try container.encodeIfPresent(sessionToken, forKey: .sessionToken)
    try container.encodeIfPresent(language, forKey: .language)
    try container.encodeIfPresent(limit, forKey: .limit)
    try container.encodeIfPresent(boundingBox, forKey: .boundingBox)
    try container.encodeIfPresent(countries, forKey: .countries)
    try container.encodeIfPresent(types, forKey: .types)
    try container.encodeIfPresent(includedPOICategories, forKey: .includedPOICategories)
    try container.encodeIfPresent(excludedPOICategories, forKey: .excludedPOICategories)
    try container.encodeIfPresent(proximity, forKey: .proximity)

    if let eta {
      try container.encode(eta.eta, forKey: .eta)
      try container.encode(eta.navigationProfile, forKey: .navigationProfile)
      try container.encodeIfPresent(eta.origin, forKey: .origin)
    }
  }
}
