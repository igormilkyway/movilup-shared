//

import Foundation

/// A suggestion will include a result name, address information, geographical context, and additional metadata when available (such as distance to proximity point).
/// It does not include geographic coordinates. To get coordinates, make a call to the /retrieve endpoint with the `mapbox_id` provided in the /suggest result.
/// Using the limit parameter, you can increase the maximum number of results up to 10.
/// Pagination is not available, but this feature may be added in a later release.
/// There is not an option to customize the order of search results.
public struct Suggestion: Codable, Sendable {
  /// The type of the result.
  /// For POIs, this will be `poi`.
  /// For categories, this will be `category`.
  /// For address-type results, the global context hierarchy is used (country, region, postcode, district, place, locality, neighborhood, address).
  let type: AdministrativeUnit // Feature type

  /// The context of the feature.
  let context: FeatureContext

  /// The name of the feature.
  let name: String

  /// The preferred name of the feature, if different than name.
  let namePreferred: String?

  /// The id to use with /retrieve to get full feature details.
  public let mapboxID: String

  /// The address of the result containing the address number and street.
  let address: String?

  /// The full address of the result, which concatenates `address` and `place_formatted`.
  let fullAddress: String?

  public var firstLine: String {
    if let namePreferred {
      "\(namePreferred) (\(name)"
    } else {
      "\(name)"
    }
  }

  public var secondLine: String {
    if let fullAddress {
      "\(fullAddress)"
    } else {
      "\(placeFormatted)"
    }
  }

  /// A formatted string of result context comprised of the place, region, country, and postcode.
  let placeFormatted: String

  /// An IETF language tag indicating the language of the result.
  let language: String

  /// A string representing an associated Maki icon to use for this result.
  let maki: String?

  /// An array including the POI categories the result falls into, if it is a POI.
  let poiCategories: Set<String>?

  /// An array including the canonical POI category IDs the result falls into, if it is a POI.
  let poiCategoryIDs: Set<String>?

  /// An array containing associated commercial brand names for the result, if it is a POI and is applicable.
  let brands: Set<String>?

  /// An array containing canonical IDs of commercial brands for the result, if it is a POI and is applicable.
  let brandIDs: Set<String>?

  /// An object containing the IDs of the feature found in external databases, with the keys being the data source names and the values being the IDs.
  let externalIDs: Dictionary<String, String>? // ExternalIDs?

  /// An object containing additional metadata for the feature, if applicable.
  let metadata: Metadata?

  /// An approximate distance to the `origin` location, in meters.
  /// If origin is not provided, it will show the approximate distance to the `proximity` location, in meters.
  public let distance: Double?

  /// The estimated time of arrival from the origin point to the feature, in minutes.
  /// If origin is not provided, then this will be the estimated time of arrival from the proximity point to the feature, in minutes.
  /// Only provided when `eta_type`, `navigation_profile` and `origin/proximity` are used in the request.
  /// If an address is not on the road network, an ETA will not be provided.
  public let eta: Double?

  /// The distance added to an input route by including the given suggestion, in meters.
  let addedDistance: Int?

  /// The estimated time added to an input route by including the given suggestion, in minutes.
  let addedTime: Int?

  enum CodingKeys: String, CodingKey {
    case type = "feature_type"
    case context

    case name
    case namePreferred = "name_preferred"
    case mapboxID = "mapbox_id"
    case address
    case fullAddress = "full_address"
    case placeFormatted = "place_formatted"
    case language
    case maki
    case poiCategories = "poi_category"
    case poiCategoryIDs = "poi_category_ids"
    case brands = "brand"
    case brandIDs = "brand_id"
    case externalIDs = "external_ids"
    case metadata
    case distance
    case eta
    case addedDistance = "added_distance"
    case addedTime = "added_time"
  }
}

//extension Suggestion {
//  func select() async throws -> LocationDTO {
//    if let coordinate = try await SearchBoxRetrieveRequest(id: mapboxID,
//                                                           language: "en",
//                                                           eta: nil)
//      .send()
//      .features.first?
//      .geometry.coordinate {
//      LocationDTO(address: fullAddress, coordinate: coordinate)
//    } else {
//      throw SendError.other("No coordinate in SearchBoxRetrieveResponse")
//    }
//  }
//}

extension Suggestion: Identifiable {
  public var id: String {
    mapboxID
  }
}

extension Suggestion: Equatable {
  public static func == (lhs: Suggestion, rhs: Suggestion) -> Bool {
    lhs.id == rhs.id
  }
}
