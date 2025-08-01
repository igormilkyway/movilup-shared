//  Created by Igor Sorokin

public struct SignInRequest: MURequest, BasicAuthenticated {
  public typealias Success = MeResponse
  public typealias Failure = MeError

  public static var email: String?
  public static var password: String?

  public static let url = "signin"
  public static let roles: Set<UserRole> = .all.subtracting([.demoEstimator, .demoDriver])

  public init(email: String, password: String) {
    Self.email = email
    Self.password = password
  }
}
