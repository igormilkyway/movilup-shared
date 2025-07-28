//

import Foundation

/// https://api.mapbox.com/search/geocode/v6/forward?q=search_text
///
/// # A basic forward geocoding request. Find Los Angeles
///$curl "https://api.mapbox.com/search/geocode/v6/forward?q=Los%20Angeles&access_token=pk.eyJ1IjoiaWdvcm1pbGt5d2F5IiwiYSI6ImNsemhzemxhczA4YWoybXF4b3E5bnA4bDcifQ.KC7iC8G9iC9IJuftReWbZA"
///
/// # Find a town called 'Chester' in a specific region
/// # Add the proximity parameter with local coordinates
/// # This ensures the town of Chester, New Jersey is in the results
/// $curl "https://api.mapbox.com/search/geocode/v6/forward?q=chester&proximity=-74.70850,40.78375&access_token=pk.eyJ1IjoiaWdvcm1pbGt5d2F5IiwiYSI6ImNsemhzemxhczA4YWoybXF4b3E5bnA4bDcifQ.KC7iC8G9iC9IJuftReWbZA"
///
/// # Specify types=country to search only for countries named Georgia
/// # Results will exclude the American state of Georgia
/// $curl "https://api.mapbox.com/search/geocode/v6/forward?q=georgia&types=country&access_token=pk.eyJ1IjoiaWdvcm1pbGt5d2F5IiwiYSI6ImNsemhzemxhczA4YWoybXF4b3E5bnA4bDcifQ.KC7iC8G9iC9IJuftReWbZA"
///
/// # Limit the results to two results using the limit option
/// # Even though there are many possible matches for "Washington", this query will only return two results.
/// $curl "https://api.mapbox.com/search/geocode/v6/forward?q=Washington&limit=2&access_token=pk.eyJ1IjoiaWdvcm1pbGt5d2F5IiwiYSI6ImNsemhzemxhczA4YWoybXF4b3E5bnA4bDcifQ.KC7iC8G9iC9IJuftReWbZA"
///
/// # Search for the Place feature "Kaaleng" in the Ilemi Triangle. Specifying the cn worldview will return the country value South Sudan. Not including leaving the worldview parameter would default to the us worldview and return the country value Kenya.
/// $curl "https://api.mapbox.com/search/geocode/v6/forward?q=Kaaleng&worldview=cn&access_token=pk.eyJ1IjoiaWdvcm1pbGt5d2F5IiwiYSI6ImNsemhzemxhczA4YWoybXF4b3E5bnA4bDcifQ.KC7iC8G9iC9IJuftReWbZA"
///
/// The forward geocoding query type allows you to look up a location using a string of search text and returns its standardized address, geographic context, and coordinates.
struct MapboxForwardGeocodingRequest: Encodable {
  /// A Mapbox access token with default permissions.
  /// All geocoding requests must include an access token.
  let accessToken: String

  /// The feature you’re trying to look up. This could be an address, a city name, etc.
  /// The search text must be expressed as a URL-encoded UTF-8 string. The address cannot contain the semicolon character ; (either raw or URL-encoded).
  /// Your search text, once decoded, must consist of at most 20 words and numbers separated by spacing and punctuation, and at most 256 characters.
  /// Unencoded, the address must be 20 words and numbers or less, separated by spacing and punctuation. The unencoded address can be 256 characters at most.
  /// The accuracy of coordinates returned by a forward geocoding request can be affected by how the addresses in the query are formatted.
  /// Learn more about address formatting best practices in the Address geocoding format guide.
  let text: String

  // MARK: - Optional parameters

  /// Specify whether you intend to store the results of the query (true) or not (false, default).
  let permanent: Bool?

  /// Specify whether to return autocomplete results (true, default) or not (false).
  /// When autocomplete is enabled, results will be included that start with the requested string, rather than responses that match it exactly.
  /// For example, a query for India might return both India and Indiana with autocomplete enabled, but only India if it’s disabled.
  /// When autocomplete is enabled, each user keystroke counts as one request to the Geocoding API. For example, a search for "Cali" would be reflected as four separate Geocoding API requests. To reduce the total requests sent, you can configure your application to only call the Geocoding API after a specific number of characters are typed.
  let autocomplete: Bool?

  /// Limit results to only those contained within the supplied bounding box.
  /// You can use the Location Helper to find a bounding box for use with this API.
  let boundingBox: BoundingBox?

  /// Limit results to one or more countries.
  /// Permitted values are ISO 3166 alpha 2 country codes separated by commas.
  /// US
  let countries: [String]?

  /// Specify the desired response format of results (`geojson`, default) or for backwards compatibility (`v5`).
  let format: String?

  /// Set the language of the text supplied in responses. Also affects result scoring, with results matching the user’s query in the requested language being preferred over results that match in another language. For example, an autocomplete query for things that start with Frank might return Frankfurt as the first result with an English (en) language parameter, but Frankreich (“France”) with a German (de) language parameter.
  /// Options are IETF language tags comprised of a mandatory ISO 639-1 language code and, optionally, one or more IETF subtags for country or script.
  /// More than one value can also be specified, separated by commas. The first language in the list will be considered as the primary language and a response will be generated for it. For other languages, translations will be provided, see the translations section.
  /// For more information on which specific languages are supported, see the language coverage section.
  /// The ISO language code to be returned. If not provided, the default is English.
  /// Allows you to specify the language in which you would like to search.
  /// One or more languages can be specified using ISO 639-1 codes (`en`).
  /// Translation availability varies by language and region, and you can expect more consistent results for areas where the specified language is most widely used.
  let language: String?

  /// Specify the maximum number of results to return.
  /// The default is 5 and the maximum supported is 10.
  let limit: Int?


  /// Bias the response to favor results that are closer to this location. Provided as two comma-separated coordinates in longitude,latitude order, or the string ip to bias based on reverse IP lookup.
  let proximity: String?

  /// Filter results to include only a subset (one or more) of the available feature types.
  /// Options are country, region, postcode, district, place, locality, neighborhood, street, and address. Multiple options can be comma-separated.
  let types: Set<AdministrativeUnit>?

  /// Returns features that are defined differently by audiences that belong to various regional, cultural, or political groups.
  /// Available worldviews are: ar,cn,in,jp,ma,rs,ru,tr,us.
  /// If worldview is not set, the us worldview boundaries are returned by default.
  let worldview: String?

  enum CodingKeys: String, CodingKey {
    case text = "q"
    case accessToken = "access_token"

    case permanent
    case autocomplete
    case boundingBox = "bbox"
    case countries = "country"
    case language
    case limit
    case proximity
    case types
    case worldview
  }
}
