//  Created by Igor Sorokin

public enum SignType: Codable, Sendable {
  case password(String)
  case passkey
}

public struct SignUpRequest: ServerRequest, PostRequest {
  public typealias Success = SignUpResponse
  public typealias Failure = SignUpError

  public static let url = "signup"

  public let type: SignType
  public let email: String
  public let firstName: String
  public let lastName: String?
  public let phoneNumber: String?

  public init(type: SignType,
              email: String,
              firstName: String,
              lastName: String?,
              phoneNumber: String?) {
    self.type = type
    self.email = email
    self.firstName = firstName
    self.lastName = lastName
    self.phoneNumber = phoneNumber
  }
}

public enum SignUpResponse: ServerSuccess {
  case emailVerificationRequired(email: String)
  case signedIn(me: MeResponse)
}

public enum SignUpError: ServerFailure {
  case processedByServer
  case resendingRequested

  case emailIsAlreadyRegistered // This email is already registered

  public var localizedDescription: String {
    switch self {
      case .processedByServer:
        "The error was processed on the server"
      case .resendingRequested:
        "A resend was requested"
      case .emailIsAlreadyRegistered:
        "This email is already registered"
    }
  }
}
