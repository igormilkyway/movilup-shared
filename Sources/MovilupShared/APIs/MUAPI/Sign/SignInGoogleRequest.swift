//  Created by Igor Sorokin

public struct SignInGoogleRequest: GoogleServerRequest, TokenAuthenticated {  
  public typealias Success = MeResponse
  public typealias Failure = MeError

  public static let url = "signin-google"
  public static let roles: Set<UserRole> = .all.subtracting([.demoEstimator, .demoDriver])

  public init() { }
}
