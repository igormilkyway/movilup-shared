//  Created by Igor Sorokin

public struct UpdateIsOnLineRequest: ServerRequest {
  public typealias Response = EmptyServerResponse
  public static let url = "update-isonline"

  public let isOnLine: Bool

  public init(isOnLine: Bool) {
    self.isOnLine = isOnLine
  }
}
