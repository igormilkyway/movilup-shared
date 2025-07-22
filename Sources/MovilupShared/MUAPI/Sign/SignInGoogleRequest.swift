//  Created by Igor Sorokin

public struct SignInGoogleRequest: GoogleServerRequest {  
  public typealias Success = MeResponse
  public typealias Failure = MeError

  public static let url = "signin-google"
//  public static let role: UserRole? = nil

  @AssertNotNilOrEmpry var accessToken = Self.accessToken

  public init() { }
}
