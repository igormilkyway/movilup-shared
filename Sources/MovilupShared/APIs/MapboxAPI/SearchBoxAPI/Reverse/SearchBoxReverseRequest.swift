//

/// reverse?longitude={longitude}&latitude={latitude}
/// curl "https://api.mapbox.com/search/searchbox/v1/reverse?longitude=-118.471383&latitude=34.023653&language=de&access_token=YOUR_MAPBOX_ACCESS_TOKEN"
public struct SearchBoxReverseRequest<Authenticator: TokenAuthenticatorProtocol>: SearchBoxRequest, Coordinated {
  public init(coordinate: Coordinate, language: String?, countries: Set<String>?) {
    self.latitude = coordinate.latitude
    self.longitude = coordinate.longitude
    self.language = language
    self.countries = countries
  }
  
  public typealias Response = SearchBoxReverseResponse
  public typealias SearchBoxReverseResponse = SearchBoxRetrieveResponse

  public static var url: String { "reverse" }

//  @AssertNotEmpry public var accessToken: String = SearchBoxReverseRequest.accessToken

  var latitude: Double
  var longitude: Double

  /// The ISO language code to be returned. If not provided, the default is English.
  /// Allows you to specify the language in which you would like to search.
  /// One or more languages can be specified using ISO 639-1 codes (`en`).
  /// Translation availability varies by language and region, and you can expect more consistent results for areas where the specified language is most widely used.
  let language: String?

  /// The number of results to return, up to 10.
  let limit: Int? = 10

  /// A comma-separated list of ISO 3166 alpha 2 country codes.
  /// US
  let countries: Set<String>?

  /// Limit results to one or more types of features.
  /// Pass one or more of the type names as a comma separated list.
  /// If no types are specified, all possible types may be returned.
  /// Available types are: country, region, prefecture, postcode, district, place, city, locality, oaza, block, street, and address.
  var types: Set<AdministrativeUnit>? = Set(AdministrativeUnit.allCases).subtracting([
    .category,
    .poi,
    .neighborhood,
    .brand,
    .secondary_address,
  ])
  
  enum CodingKeys: String, CodingKey {
//    case accessToken = "access_token"
    case latitude
    case longitude

    case language
    case limit
    case countries = "country"
    case types
  }
}
