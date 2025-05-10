//  Created by Igor Sorokin

public protocol AuthenticatingServerRequest: ServerRequest where Failure: AuthenticatingServerFailure {
  static var roles: [UserRole] { get }
}

extension AuthenticatingServerRequest {
  public static var roles: [UserRole] {
    UserRole.allCases
  }
}

public protocol BasicAuthenticatingServerRequest: AuthenticatingServerRequest {
//  var email: String { get }
//  var password: String { get }
}

extension BasicAuthenticatingServerRequest {

}

public protocol TokenAuthenticatingServerRequest: AuthenticatingServerRequest { }

