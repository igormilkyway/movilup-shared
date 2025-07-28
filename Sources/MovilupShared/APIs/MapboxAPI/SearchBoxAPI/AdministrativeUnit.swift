//

/// Feature type
/// Various types of administrative units are available via the Search Box API. Any type might appear as a top-level response, as context in a top-level response, or as a filtering option using the optional `types` parameter.
/// This hierarchy of feature types is also used to determine what will be returned as the encompassing parent features in a Geocoding API response object's `context` property.
/// For example, if the returned feature is a `place` (like Detroit), then the encompassing parent features in the context property will be the `region` (the state of Michigan) and the `country` (United States).
/// The full spatial hierarchy, ordered from the most granular to the largest, is: point of interest (POI), address, neighborhood, locality, postcode, place, district, region, and country.
/// The geographic feature types listed from the largest to the most granular.
///
/// SearchBoxSuggestRequest: country, region,                   postcode, district, place, city, locality, neighborhood, street, address, poi, category
/// SearchBoxReverseRequest: country, region, prefecture, postcode, district, place, city, locality, oaza, block,     street, address
enum AdministrativeUnit: String, LosslessStringConvertible, Codable {
  // MARK: - Polygon features

  /// Generally recognized countries or, in some cases like Hong Kong, an area of quasi-national administrative status that has a designated country code under ISO 3166-1.
  /// Refers to generally recognized countries or, in some cases, areas with quasi-national administrative status such as Hong Kong. These areas have been assigned a designated country code under ISO 3166-1.
  case country

  /// Top-level sub-national administrative features, such as states in the United States or provinces in Canada or China.
  /// States, provinces, and prefectures.
  /// This is typically the largest sub-national administrative unit of a country.
  /// Some large cities (such as Tokyo and Istanbul) may be categorized as regions rather than places.
  case region

  /// Postal codes used in country-specific national addressing systems.
  /// A geographic area of the address component used for sorting mail.
  case postcode

  /// Features that are smaller than top-level administrative features but typically larger than cities, in countries that use such an additional layer in postal addressing (for example, prefectures in China).
  /// An administrative unit that is larger than a place but smaller than a region. Only present in some countries.
  case district

  /// Typically these are cities, villages, municipalities, etc. They’re usually features used in postal addressing, and are suitable for display in ambient end-user applications where current-location context is needed (for example, in weather displays).
  /// Cities, towns, and villages.
  /// Some large cities (such as Tokyo and Istanbul) may be categorized as regions rather than places.
  case place

  case city
  /// Official sub-city features present in countries where such an additional administrative layer is used in postal addressing, or where such features are commonly referred to in local parlance. Examples include city districts in Brazil and Chile and arrondissements in France.
  /// An administrative unit that is smaller than a place.
  /// Only present in some countries.
  case locality

  /// Colloquial sub-city features often referred to in local parlance. Unlike locality features, these typically lack official status and may lack universally agreed-upon boundaries.
  /// Not available for reverse lookup requests.
  /// A colloquial name for a smaller area within a place. Neighborhoods do not necessarily have specific, legally defined boundaries.
  /// Only present in some countries.
  case neighborhood

  /// The street, with no house number.
  /// Street features which host one or more addresses
  case street

  /// Special feature type reserved for Japanese addresses.
  case block

  // MARK: - Point features

  /// Individual residential or business addresses as a street with house number.
  /// A specific mailing address, including the address number if applicable.
  /// Individual residential or business addresses.
  case address

  /// Sub-unit, suite, or lot within a single parent address.
  /// Currently available in the US only.
  case secondary_address

  /// Points of interest (POI): A named place including commercial businesses, public buildings, monuments, and parks, among other features.
  case poi
  case brand
  
  // MARK: - Other features

  case category
  case prefecture
  case oaza
}

extension AdministrativeUnit: CaseIterable {
  
}
