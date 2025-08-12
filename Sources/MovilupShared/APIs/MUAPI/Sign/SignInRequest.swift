//  Created by Igor Sorokin

public struct SignInRequest<API: APIProtocol, Authenticator: BasicAuthenticatorProtocol>: MURequest, BasicHeaderAuthenticatedRequest {
  public typealias Success = MeResponse
  public typealias Failure = MeError

//  public static var email: String?
//  public static var password: String?

  public static var url: String { "signin" }
  public static var roles: Set<UserRole> { .all.subtracting([.demoEstimator, .demoDriver]) }

  public init() {}
//  public init(email: String, password: String) {
//    Self.email = email
//    Self.password = password
//  }
}
