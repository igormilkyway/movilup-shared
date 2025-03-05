//  Created by Igor Sorokin

public struct SignInRequest: BasicAuthenticatingServerRequest {
  public typealias Success = MeResponse
  public typealias Failure = MeError

  public static let url = "signin"
//  public static let authentication: ServerRequestAuthentication = .basic

  public init() {}
}
