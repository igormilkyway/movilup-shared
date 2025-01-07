//  Created by Igor Sorokin

public protocol ServerRequest: Codable, Sendable {
  associatedtype Success: ServerSuccess
  associatedtype Failure: ServerFailure

  static var url: String { get }
}

extension ServerRequest {
  public typealias Success = EmptyServerResponse
  public typealias Failure = MeError
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
