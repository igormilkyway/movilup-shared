//  Created by Igor Sorokin

public protocol ServerSuccess: Codable, Sendable {}

extension Array: ServerSuccess where Element: ServerSuccess {}

public struct EmptyServerResponse: ServerSuccess {
  public init() {}
}

extension Optional: ServerSuccess where Wrapped: ServerSuccess {}
