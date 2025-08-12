//

import Foundation

/// The /retrieve endpoint provides detailed information about a feature including geographic coordinates.
/// In a search session, this endpoint is called when the user selects an item from the suggested results provided by /suggest endpoint.
/// After a successful call to the /suggest endpoint, you will use the ID contained in a suggestion's `mapbox_id` to retrieve detailed information about the feature.
/// GET https://api.mapbox.com/search/searchbox/v1/retrieve/{id}
/// $curl "https://api.mapbox.com/search/searchbox/v1/retrieve/{id}?session_token=[GENERATED-UUID]&access_token=pk.eyJ1IjoiaWdvcm1pbGt5d2F5IiwiYSI6ImNsemhzemxhczA4YWoybXF4b3E5bnA4bDcifQ.KC7iC8G9iC9IJuftReWbZA"
/// $curl

public struct SearchBoxRetrieveRequest<Authenticator: TokenAuthenticatorProtocol>: SearchBoxRequest {
  public init(id: String, language: String?, eta: ETACalculation?) {
    self.id = id
    self.language = language
    self.eta = eta
  }
  
  public typealias Response = SearchBoxRetrieveResponse

  public static var url: String { "retrieve" }

  public var path: String {
    "/\(id)"
  }
  
  var id = ""

//  @AssertNotEmpry public var accessToken: String = Self.accessToken

  /// A customer-provided session token value, which groups a series of requests together for billing purposes.
  /// UUIDv4 is recommended.
  let sessionToken = sharedSessionToken

  /// The ISO language code to be returned. If not provided, the default is English.
  let language: String?

  /// Enable Estimate Time Arrival (ETA) calculation in the response. The only allowed value for this parameter is navigation.
  /// When this parameters is used, `navigation_profile` and either `origin` or `proximity` is also should be provided.
  /// Enabling ETA calculations will introduce additional latency and incur extra costs, as each search result for which ETAs are calculated (matrix elements) will be billed according to the Mapbox Matrix API pricing.
  let eta: ETACalculation? // isETACalculation is enabled

  enum CodingKeys: String, CodingKey {
//    case accessToken = "access_token"
    case sessionToken = "session_token"
    
    case language
    case eta = "eta_type"
  }
}

public extension SearchBoxRetrieveRequest {
  func send(verbose: Bool = false) async throws -> Response {
    let (statusCode, responseData) = try await urlRequest.send(verbose: verbose)

    guard statusCode == 200 else {
      throw SendError.badStatusCode(statusCode)
    }

    let response = try JSONDecoder().decode(Response.self, from: responseData)

    if verbose {
      print(response)
    }
    
    sharedSessionToken = UUID()

    return response
  }
}

