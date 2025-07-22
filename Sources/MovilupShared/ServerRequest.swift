//  Created by Igor Sorokin

import Foundation

#if canImport(FoundationNetworking)
import FoundationNetworking
#endif

public protocol ServerRequest: Encodable, Sendable {
  associatedtype Response: ServerResponse

  static var baseURL: URL { get }
  static var url: String { get }
  
  var path: String { get }
  var serialized: Data { get throws }
  var headers: [String: String] { get }

  func urlComponents(url: URL) -> URLComponents
  func urlRequest() throws -> URLRequest

  func send(verbose: Bool) async throws -> Response
}

public extension ServerRequest {
  var path: String { "" }

  var headers: [String: String] { [:] }

  func urlComponents(url baseURL: URL) -> URLComponents {
    URLComponents(url: baseURL, resolvingAgainstBaseURL: false)!.with {
      $0.path.append(Self.url)
      $0.path.append(path)
    }
  }
  
  func send(verbose: Bool = false) async throws -> Response {
    let (statusCode, responseData) = try await urlRequest().send(verbose: verbose)

    guard statusCode == 200 else {
      throw SendError.badStatusCode(statusCode)
    }

    return try JSONDecoder().decode(Response.self, from: responseData)
  }
}

public protocol ServerThrowingRequest: ServerRequest {
  associatedtype Success: ServerResponse
  associatedtype Failure: ServerFailure

  static var apiVersion: String { get } // SemVer

  var apiVersion: String { get } // SemVer
}

public extension ServerThrowingRequest {
  typealias Response = Result<Success, Failure>
  typealias Success = EmptyServerResponse
  typealias Failure = MeError

  static var apiVersion: String {
    "1.0.0"
  }

  var apiVersion: String {
    Self.apiVersion
  }

  func send(verbose: Bool = false) async throws -> Self.Success {
    let (statusCode, responseData) = try await urlRequest().send(verbose: verbose)

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
