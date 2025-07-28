//

import Foundation

public struct Properties: Codable, Sendable {
  /// The type of the result.
  /// For POIs, this will be `poi`.
  /// For address-type results, the global context hierarchy is used (country, region, postcode, district, place, locality, neighborhood, address).
  let type: AdministrativeUnit

  /// The context of the feature.
  let context: FeatureContext

  /// The name of the feature.
  let name: String

  /// The preferred name of the feature, if different than name.
  let namePreferred: String?

  /// The ID associated with the feature.
  let mapboxID: String

  /// The address of the result containing the address number and street.
  let address: String?

  /// The full address of the result, which concatenates `address` and `place_formatted`.
  let fullAddress: String?

  public var fullAddressOrName: String {
    fullAddress ?? name
  }

  /// A formatted string of result context comprised of the place, region, country, and postcode.
  /// It is the part of the result which comes after address.
  let placeFormatted: String?

  /// An IETF language tag indicating the language of the result.
  let language: String?

  /// A string representing an associated Maki icon to use for this result.
  let maki: String? // "marker"

  /// An array including the POI categories the result falls into, if it is a POI.
  let poiCategories: [String]?

  /// An array including the canonical POI category IDs the result falls into, if it is a POI.
  let poiCategoryIDs: [String]?

  /// An array containing associated commercial brand names for the result, if it is a POI and is applicable.
  let brands: [String]?

  /// An array containing canonical IDs of commercial brands for the result, if it is a POI and is applicable.
  let brandIDs: [String]?

  /// An object containing the IDs of the feature found in external databases, with the keys being the data source names and the values being the IDs.
  let externalIDs: Dictionary<String, String>? // ExternalIDs?

  /// An object containing additional metadata for the feature, if applicable.
  let metadata: Metadata?

  //  The geographical coordinates of the result.
  let coordinate: RoutableCoordinate

  let boundingBox: BoundingBox?

  enum CodingKeys: String, CodingKey {
    case type = "feature_type"
    case context

    case name
    case namePreferred = "name_preferred"
    case mapboxID = "mapbox_id"

    case address
    case fullAddress = "full_address"
    case placeFormatted = "place_formatted"
    case coordinate = "coordinates"
    case boundingBox = "bbox"
    case language
    case maki
    case poiCategories = "poi_category"
    case poiCategoryIDs = "poi_category_ids"
    case brands = "brand"
    case brandIDs = "brand_id"
    case externalIDs = "external_ids"
    case metadata
  }
}

extension Properties: CustomStringConvertible {
  public var description: String {
    """
      type: \(type) \(maki != nil ? "( maki: \(maki!) )" : "" )
      name: \(name) \(namePreferred != nil ? "( namePreferred: \(namePreferred!) )" : "" ) \
    \(placeFormatted != nil ? "\n  placeFormatted: \(placeFormatted!)" : "" ) \
    \(fullAddress != nil ? "\n  fullAddress: \(fullAddress!)" : "" ) \
    \(address != nil ? "\n  address: \(address!)" : "" )
      coordinate:
      \(coordinate) \
    \(boundingBox != nil ? "\nboundingBox: \(boundingBox!)" : "" )
      context: \(context) \
    \(other != nil ? "\n  other: \(other!)" : "" )
    """
  }

  private var other: String? {
    let other = """
    \(poiCategories != nil ? "\n poiCategories: \(poiCategories!)" : "" )\
    \(poiCategoryIDs != nil ? "\n  poiCategoryIDs: \(poiCategoryIDs!)" : "" )\
    \(brands != nil ? "\n  brands: \(brands!)" : "" )\
    \(brandIDs != nil ? "\n  brandIDs: \(brandIDs!)" : "" )\
    \(externalIDs != nil ? "\n  externalIDs: \(externalIDs!)" : "" )\
    \(metadata != nil ? "\n  metadata: \(metadata!)" : "" )
    """

    if !other.isEmpty {
      return """
        \(other)
        """
    } else {
      return nil
    }
  }
}
