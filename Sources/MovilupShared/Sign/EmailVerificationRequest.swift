//  Created by Igor Sorokin

public struct EmailVerificationRequest: ServerRequest, PostRequest {
  public typealias Success = MeResponse
  public typealias Failure = EmailVerificationRequestError

  public static let url = "email-verification"

  public let email: String
  public let code: String

  public init(email: String, code: String) {
    self.email = email
    self.code = code
  }
}

public enum EmailVerificationRequestError: ServerFailure {
  case processedByServer
  case resendingRequested

  case wrongEmail
  case codeHasExpired // The code has expired
  case wrongCode
}
