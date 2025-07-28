//

import Foundation

public protocol SearchBoxRequest: MapboxRequest { }

public extension SearchBoxRequest {
  static var baseURL: URL {
    URL(string: "https://api.mapbox.com/search/searchbox/v1/")!
  }

  func send(verbose: Bool = false) async throws -> Response {
    let (statusCode, responseData) = try await urlRequest().send(verbose: verbose)

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

//enum SearchBoxRequestError: Error {
//  case notAuthorized
//  case badRequest
//  case forbidden
//  case unexpected(code: Int)
//  case `internal`(error: Error)
//  case sessionToken
//  case badResponse
//
////  init(_ error: String) {
////    switch error {
////      case .httpError(let code):
////        self.init(code: code)
////      default:
////        self = .internal(error: error)
////    }
////  }
//
//  init(code: Int) {
//    switch code {
//      case 400:
//        self = .badRequest
//      case 401:
//        self = .notAuthorized
//      case 403:
//        self = .forbidden
//      default:
//        self = .unexpected(code: code)
//    }
//  }
//
//  var localizedDescription: String {
//    switch self {
//      case .notAuthorized:
//        "\(self): 401: Check the access token used in the query."
//      case .badRequest:
//        "\(self): 400: Check the request for syntax errors in the endpoint, path parameters, and query parameters."
//      case .forbidden:
//        "\(self): 403: There may be an issue with your account. Check your Account page for more details. In some cases, using an access tokens with URL restrictions can also result in this error. For more information, see our Token management guide."
//      case .unexpected(let code):
//        "\(self): \(code)"
//      case .internal(let error):
//        "\(self): \(error.localizedDescription)"
//      case .sessionToken, .badResponse:
//        "\(self)"
//    }
//  }
//}
