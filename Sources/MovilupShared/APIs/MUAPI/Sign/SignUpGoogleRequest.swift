//  Created by Igor Sorokin

public protocol GoogleServerRequest: MURequest { }

public struct SignUpGoogleRequest: GoogleServerRequest, TokenInBodyAuthenticated {
  public typealias Success = SignUpResponse
  public typealias Failure = SignUpError

  public static let url = "signup-google"
  #warning("Remove RoleAuthenticated conformance")
  public static let roles: Set<UserRole> = .all

  @AssertNotEmpry public var accessToken: String = Self.accessToken

  public init() { }
}
