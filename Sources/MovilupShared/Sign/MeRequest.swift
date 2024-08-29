//

public struct MeRequest: ServerRequest {
  public typealias Response = MeResponse
  public static let url = "me"

  public init() {}
}
