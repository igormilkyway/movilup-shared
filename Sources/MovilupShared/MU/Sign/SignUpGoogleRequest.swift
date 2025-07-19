//  Created by Igor Sorokin

public struct SignUpGoogleRequest: MURequest, TokenInBodyAuthenticated {
  public typealias Success = SignUpResponse
//  public typealias Failure = SignUpError

  public static let url = "signup-google"
//  public static let role: UserRole? = .customer

  public init() { }
}
