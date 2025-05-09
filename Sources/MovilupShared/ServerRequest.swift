//  Created by Igor Sorokin

//public protocol API {
//  static var baseURL: String { get }
//}
//
//public struct MUAPI: API {
//  public static var baseURL = ""
//}

protocol MUServerRequest: ServerRequest, PostRequest { }

//extension MUServerRequest {
//  static var method: HTTPMethod {
//    .post
//  }
//}
//
//protocol APIServerRequest: ServerRequest {
//  associatedtype RequestAPI: API
//}
//
//public enum HTTPMethod {
//  case get
//  case post
//}

public protocol ServerRequest: Codable, Sendable, MethodRequest {
  associatedtype Success: ServerSuccess
  associatedtype Failure: ServerFailure

  static var url: String { get }
//  static var method: HTTPMethod { get }

  static var apiVersion: String { get } // SemVer

  var apiVersion: String { get } // SemVer
}

extension ServerRequest {
  public typealias Success = EmptyServerResponse
  public typealias Failure = MeError

  public static var apiVersion: String {
    "1.0.0"
  }

  public var apiVersion: String {
    Self.apiVersion
  }
}

public protocol GoogleServerRequest: ServerRequest {
  var token: String { get }
}

extension Result: Codable where Success: ServerSuccess, Failure: ServerFailure {
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
