//  Created by Igor Sorokin

//public enum ServerRequestAuthentication: Sendable {
//  case basic
//  case token
//}

public protocol AuthenticatingServerRequest: ServerRequest where Failure: AuthenticatingServerFailure {
//  static var authentication: ServerRequestAuthentication { get }
  static var roles: [UserRole] { get }
}

extension AuthenticatingServerRequest {
//  public static var authentication: ServerRequestAuthentication {
//    .token
//  }

  public static var roles: [UserRole] {
    UserRole.allCases
  }
}

public protocol BasicAuthenticatingServerRequest: AuthenticatingServerRequest { }
public protocol TokenAuthenticatingServerRequest: AuthenticatingServerRequest { }

