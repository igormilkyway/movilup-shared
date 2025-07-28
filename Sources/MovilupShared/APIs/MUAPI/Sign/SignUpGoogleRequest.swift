//  Created by Igor Sorokin

public protocol GoogleServerRequest: MURequest, TokenInBodyAuthenticated { }

public struct SignUpGoogleRequest: GoogleServerRequest {
  public typealias Success = SignUpResponse
  public typealias Failure = SignUpError

  public static let url = "signup-google"
//  public static let role: UserRole? = .customer

  @AssertNotEmpry public var accessToken: String = Self.accessToken

  public init() { }
}
