//  Created by Igor Sorokin

public struct SignInGoogleRequest<API: APIProtocol, Authenticator: TokenAuthenticatorProtocol>: GoogleServerRequest, TokenHeaderAuthenticatedRequest {  
  public typealias Success = MeResponse
  public typealias Failure = MeError

  public static var url: String { "signin-google" }
  public static var roles: Set<UserRole> { .all.subtracting([.demoEstimator, .demoDriver]) }

  public init() { }
}
