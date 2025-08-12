//

public protocol AuthenticatorProtocol {
  static var isValid: Bool { get }
}

public protocol BasicAuthenticatorProtocol: AuthenticatorProtocol {
  static var email: String { get }
  static var password: String { get }
}

public extension BasicAuthenticatorProtocol {
  static var isValid: Bool {
    let isValid = !email.isEmpty && !password.isEmpty
    assert(isValid, "Authenticator is not valid")
    return isValid
  }
}

public struct DefaultBasicAuthenticator: BasicAuthenticatorProtocol {
  public static var email: String { "" }
  public static var password: String { "" }
  public static var isValid: Bool { false }
}

public protocol TokenAuthenticatorProtocol: AuthenticatorProtocol {
  static var token: String { get }
  static var name: String { get }
}

public extension TokenAuthenticatorProtocol {
  static var name: String { "access_token" }
}

public extension TokenAuthenticatorProtocol {
  static var isValid: Bool {
    let isValid = !token.isEmpty
    assert(isValid, "Authenticator is not valid")
    return isValid
  }
}

public struct DefaultTokenAuthenticator: TokenAuthenticatorProtocol {
  public static var token: String { "" }
  public static var isValid: Bool { false }
}

