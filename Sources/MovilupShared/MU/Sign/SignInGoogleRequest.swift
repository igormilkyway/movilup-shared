//  Created by Igor Sorokin

public struct SignInGoogleRequest: MURequest, TokenInBodyAuthenticated {
  public typealias Success = MeResponse
  public typealias Failure = MeError

  public static let url = "signin-google"
//  public static let role: UserRole? = nil

  public init() { }
}
