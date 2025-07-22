//  Created by Igor Sorokin

import Foundation

//public protocol AuthenticatedWithRoles: ServerThrowingRequest where Failure: AuthenticatingServerFailure {
//  static var roles: [UserRole] { get }
//}
//
//extension AuthenticatingServerRequest {
//  public static var roles: [UserRole] {
//    UserRole.allCases
//  }
//}

public protocol Authenticated where Self: ServerRequest {
  static var authenticationHeaders: [String: String] { get throws }
}

public protocol BasicAuthenticated: Authenticated {
  static var email: String?  { get set }
  static var password: String?  { get set }
}

public extension BasicAuthenticated {
  static var email: String? { nil }
  static var password: String? { nil }

  static var authenticationHeaders: [String: String] {
    get throws {
      if let email, let password {
        ["Authorization": "Basic \(Data("\(email):\(password)".utf8).base64EncodedString())"]
      }
      else {
        throw SendError.noCredentials
      }
    }
  }
}

public protocol TokenAuthenticated: Authenticated {
  static var accessToken: String? { get }
}

public extension TokenAuthenticated {
  static var accessToken: String? { nil }

  static var authenticationHeaders: [String: String] {
    get throws {
      if let accessToken {
        ["Authorization": "Bearer \(accessToken)"]
      }
      else {
        throw SendError.noCredentials
      }
    }
  }
}

public protocol TokenInBodyAuthenticated: TokenAuthenticated {
//  var accessToken: String? { get set }
}

public extension TokenInBodyAuthenticated {
  static var authenticationHeaders: [String: String] { [:] }

//  var _accessToken: AssertNotNilOrEmpry {
//    AssertNotNilOrEmpry(wrappedValue: nil)
//  }
//
//  var accessToken: String? {
//    get { _accessToken.wrappedValue }
//    set { _accessToken.wrappedValue = newValue }
//  }
}

@propertyWrapper
public struct AssertNotNilOrEmpry: Codable, Sendable {
  private var accessToken: String?

  public var wrappedValue: String? {
    get {
      assert(accessToken != nil && !accessToken!.isEmpty, "accessToken is nil or empty")

      return accessToken
    }

    set {
      accessToken = newValue
    }
  }

  public init(wrappedValue accessToken: String?) {
    assert(accessToken != nil && !accessToken!.isEmpty, "accessToken is nil or empty")

    self.accessToken = accessToken
  }
}

//enum Authentication {
//  case basic
//  case token
//  case tokenInBody
//}

//  //    let configuration = URLSessionConfiguration.default.with {
//  //      $0.httpAdditionalHeaders = [
//  //        "Authorization": "Bearer \(accessToken.tokenString)"
//  //      ]
//  //    }
//  //
//  //    return URLSession(configuration: configuration)
//  }
