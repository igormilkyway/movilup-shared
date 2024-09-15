//  Created by Igor Sorokin

public enum SignUpResponse: ServerResponse {
  case emailVerificationRequired(email: String)
  case signedIn(me: MeResponse)
}
