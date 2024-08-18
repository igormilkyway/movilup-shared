//

public enum SignUpResponse: ServerResponse {
  case emailVerificationRequired(email: String)
  case signedIn(token: String)
}
