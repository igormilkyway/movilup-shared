//

public enum SignUpResponse: ServerResponse {
  case emailVerificationRequired(email: String)
  case signedIn(me: MeResponse)
}
