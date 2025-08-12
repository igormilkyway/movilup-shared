//  Created by Igor Sorokin

public protocol ServerResponse: Codable, Sendable { }

extension Array: ServerResponse where Element: ServerResponse {}

public struct EmptyServerResponse: ServerResponse {
  public init() {}
}

extension Optional: ServerResponse where Wrapped: ServerResponse {}

extension Result: ServerResponse where Success: ServerResponse, Failure: ServerFailure { }

//public protocol ServerSuccess: ServerResponse {}

