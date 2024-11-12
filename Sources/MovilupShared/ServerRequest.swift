//  Created by Igor Sorokin

import Foundation

public protocol ServerRequest: Codable, Sendable {
  associatedtype Response: Codable
  associatedtype Error: RequestError

  static var url: String { get }
}

public enum ServerRequestAuthentication: Sendable {
  case basic
  case token
}

public protocol AuthenticatingServerRequest: ServerRequest where Error: AuthenticatingRequestError {
  static var authentication: ServerRequestAuthentication { get }
}

public protocol GoogleAuthenticatingServerRequest: ServerRequest where Error: AuthenticatingRequestError {
  var token: String { get }
}

public protocol RequestError: LocalizedError, Codable, Comparable {
//  static func processedByServer(localizedDescription: String) -> Self
  static var processedByServer: Self { get }
  static var resendingRequested: Self { get }
}

public protocol AuthenticatingRequestError: RequestError {
  static var wrongCredentials: Self { get }
}

//public protocol GoogleAuthenticatingRequestError: RequestError {
//}

extension ServerRequest {
  public typealias Error = MeError
}

public protocol ServerResponse: Codable, Sendable {}

//extension Array: ServerResponse where Element: Sendable {}

public struct EmptyServerResponse: ServerResponse {
  public init() {}
}

extension Result: Codable where Success: Codable, Failure: Codable {
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
