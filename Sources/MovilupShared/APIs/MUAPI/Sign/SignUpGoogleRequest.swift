//  Created by Igor Sorokin

public protocol GoogleServerRequest: MURequest { }

public struct SignUpGoogleRequest<API: APIProtocol, Authenticator: TokenAuthenticatorProtocol>: GoogleServerRequest, TokenBodyAuthenticatedRequest {
  public typealias Success = SignUpResponse
  public typealias Failure = SignUpError

  public static var url: String { "signup-google" }
#warning("Remove RoleAuthenticated conformance")
  public static var roles: Set<UserRole> { .all }

//  @AssertNotEmpry public var accessToken: String = Self.accessToken

  public init() { }
}
