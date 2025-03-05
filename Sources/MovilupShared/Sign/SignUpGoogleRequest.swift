//  Created by Igor Sorokin

public struct SignUpGoogleRequest: GoogleServerRequest {
  public typealias Success = SignUpResponse
  public typealias Failure = SignUpError

  public static let url = "signup-google"
//  public static let role: UserRole? = .customer

  public let token: String

  public init(token: String) {
    self.token = token
  }
}
