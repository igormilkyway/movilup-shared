//  Created by Igor Sorokin

import Foundation

#if canImport(FoundationNetworking)
import FoundationNetworking
#endif

public protocol ServerRequest<API>: Encodable, Sendable {
  associatedtype API: APIProtocol
  associatedtype Response: ServerResponse

  static var url: String { get }
  static var method: String? { get }

  var path: String { get }
  var query: String? { get throws }
  var body: Data? { get throws }
  var headers: [String: String] { get throws }

  func send(verbose: Bool) async throws -> Response
}

public extension ServerRequest {
  var path: String { "" }
  var headers: [String: String] { [:] }

  var urlRequest: URLRequest {
    get throws {
      let baseURL = API.baseURL
      
      guard
        let urlComponents = (try URLComponents(url: baseURL, resolvingAgainstBaseURL: false)?.with {
          $0.path.append(Self.url)
          $0.path.append(path)
          $0.query = try query

          //    urlComponents.queryItems?.append(URLQueryItem(name: "Name", value: "Value"))
          //    print("GetRequest encoded: \(urlComponents.query!)")
        }),
        let url = urlComponents.url
      else {
        throw SendError.other("Wrong URL")
      }

      return try URLRequest(url: url).with {
        $0.httpMethod = Self.method
        //      let version = "1.0.1"
        //      $0.setValue("MU/\(version) (iOS)", forHTTPHeaderField: "User-Agent")

        for (headerName, headerValue) in try headers {
//          print("headerName: \(headerName), headerValue: \(headerValue)")
          $0.setValue(headerValue, forHTTPHeaderField: headerName)
        }

        $0.httpBody = try body
      }
    }
  }

  func send(verbose: Bool = false) async throws -> Response {
    let (statusCode, responseData) = try await urlRequest.send(verbose: verbose)

    guard statusCode == 200 else {
      throw SendError.badStatusCode(statusCode)
    }

    return try JSONDecoder().decode(Response.self, from: responseData)
  }
}

public protocol ServerThrowingRequest: ServerRequest, Codable {
  associatedtype Success: ServerResponse = EmptyServerResponse
  associatedtype Failure: ServerFailure = MeError
}

public extension ServerThrowingRequest {
  typealias Response = Result<Success, Failure>

  func send(verbose: Bool = false) async throws -> Self.Success {
    let urlRequest = try urlRequest
    let (statusCode, responseData) = try await urlRequest.send(verbose: verbose)

    guard statusCode == 200 else {
      throw SendError.badStatusCode(statusCode)
    }

    let result = try JSONDecoder().decode(Response.self, from: responseData)
    return try result.get()
  }
}

extension Result: Codable where Success: ServerResponse, Failure: ServerFailure {
  enum CodingKeys: String, CodingKey {
    case success
    case failure
  }

  public init(from decoder: any Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)

    if let success = try container.decodeIfPresent(Success.self, forKey: .success) {
      self = .success(success)
    } else {
      self = .failure(try container.decode(Failure.self, forKey: .failure))
    }
  }

  public func encode(to encoder: any Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)

    switch self {
      case .success(let success):
        try container.encode(success, forKey: .success)
      case .failure(let failure):
        try container.encode(failure, forKey: .failure)
    }
  }
}

public extension URLRequest {
  func send(verbose: Bool) async throws -> (Int, Data) {
    if verbose {
      print(url!)
    }

    let (responseData, urlResponse) = try await URLSession.shared.data(for: self)

    guard let httpResponse = urlResponse as? HTTPURLResponse else {
      throw SendError.invalidResponse("No HTTPURLResponse")
    }

    return (httpResponse.statusCode, responseData)
  }
}

//extension String: @retroactive LocalizedError {
//  public var errorDescription: String? { self }
//}

public enum SendError: LocalizedError {
  case noCredentials
  case invalidResponse(String)
  case badStatusCode(Int)
  case other(String)

//  var localizedDescription: String? { "self" }
  public var errorDescription: String? { "\(self)" }
}
