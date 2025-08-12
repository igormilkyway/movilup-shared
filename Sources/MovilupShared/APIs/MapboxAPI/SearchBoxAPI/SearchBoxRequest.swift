//

import Foundation

public protocol SearchBoxRequest: MapboxRequest where API == SearchBoxAPI { }

public struct SearchBoxAPI: APIProtocol {
  public static var baseURL: URL { .init(string: "https://api.mapbox.com/search/searchbox/v1/")! }
}

public extension SearchBoxRequest {
  func send(verbose: Bool = false) async throws -> Response {
    let (statusCode, responseData) = try await urlRequest.send(verbose: verbose)

    //    if verbose, let responseString = String(data: responseData, encoding: .utf8) {
    //      print(responseString)
    //    }

    guard statusCode == 200 else {
      throw SendError.badStatusCode(statusCode)
    }

    let response = try JSONDecoder().decode(Response.self, from: responseData)

    if verbose {
      print(response)
    }

    return response
  }
}
