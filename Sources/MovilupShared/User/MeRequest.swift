//

public struct MeRequest: ServerRequest {
  public typealias Response = UsersResponseElement
  public static let url = "me"

  public init() {}
}

//public typealias MeResponse = UsersResponseElement
//extension MeResponse: ServerResponse {}
