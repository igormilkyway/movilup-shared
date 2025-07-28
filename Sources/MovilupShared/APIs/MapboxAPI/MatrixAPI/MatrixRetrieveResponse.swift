//

import Foundation

struct MatrixRetrieveResponse: ServerResponse {
  /// A string indicating the state of the response. This is a separate code than the HTTP status code.
  /// On normal valid responses, the value will be Ok. See the errors section below for more information.
  ///
  /// For responses with HTTP status codes `<` 500, the JSON response body includes the code property, which may be used by client programs to manage control flow.
  /// The response body may also include a message property with a human-readable explanation of the error.
  ///
  /// If a server error occurs, the HTTP status code will be >= 500 and the response will not include a code property.
  var code: String?
  var message: String?
  var errorDetail: String?

  /// Distances as an array of arrays that represent the matrix in row-major order. distances[i][j] gives the travel distance from the ith source to the jth destination.
  /// All values are in meters. The distance between the same coordinate is always 0. Finding no distance, the result will be null.
  var distances: [[Double?]]?

  /// Durations as an array of arrays that represent the matrix in row-major order. durations[i][j] gives the travel time from the ith source to the jth destination.
  /// All values are in seconds. The duration between the same coordinate is always 0. Finding no duration, the result will be null.
  var durations: [[Double?]]?

  enum CodingKeys: String, CodingKey {
    case code
    case message
    case errorDetail = "error_detail"
    case distances
    case durations
  }
  
  init(from decoder: any Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)

//    guard let httpStatusCode = decoder.userInfo[.httpStatusCode] as? Int else {
//      throw "No httpStatusCode in decoder's userInfo"
//    }

    self.code = try container.decodeIfPresent(String.self, forKey: .code)
    self.message = try container.decodeIfPresent(String.self, forKey: .message)
    self.errorDetail = try container.decodeIfPresent(String.self, forKey: .errorDetail)
    self.distances = try container.decodeIfPresent([[Double?]].self, forKey: .distances)
    self.durations = try container.decodeIfPresent([[Double?]].self, forKey:.durations)
  }
}


extension MatrixRetrieveRequest {
  func send(verbose: Bool = false) async throws -> Response {
    let (statusCode, responseData) = try await urlRequest().send(verbose: verbose)

    guard statusCode < 500 else {
      throw SendError.badStatusCode(statusCode)
    }

    let response = try JSONDecoder().with {
      $0.userInfo[.httpStatusCode] = statusCode
    }
      .decode(Response.self, from: responseData)

    guard statusCode == 200, let code = response.code, code == "Ok" else {
      throw SendError.other ({
        var error = response.code != nil ? "code: \(response.code!) " : ""
        error += response.message != nil ? "message: \(response.message!) " : ""
        error += response.errorDetail != nil ? "detail: \(response.errorDetail!) " : ""

        error += "\(response)"
        return error
      }())
    }

    if verbose {
      print(response)
    }
    
    return response
  }
}
