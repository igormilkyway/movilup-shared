//  Created by Igor Sorokin

import Foundation

public protocol RoleAuthenticatedRequest {
  static var roles: Set<UserRole> { get }
}

public protocol AuthenticatedRequest<Authenticator> {
  associatedtype Authenticator: AuthenticatorProtocol
}

public protocol HeaderAuthenticatedRequest<Authenticator>: AuthenticatedRequest {
  static var authenticationHeaders: [String: String] { get throws }
}

public protocol BasicHeaderAuthenticatedRequest: HeaderAuthenticatedRequest where Authenticator: BasicAuthenticatorProtocol {}
public protocol TokenHeaderAuthenticatedRequest: HeaderAuthenticatedRequest where Authenticator: TokenAuthenticatorProtocol {}
public protocol TokenBodyAuthenticatedRequest: AuthenticatedRequest where Authenticator: TokenAuthenticatorProtocol { }

public extension BasicHeaderAuthenticatedRequest {
  static var authenticationHeaders: [String: String] {
    get throws {
      if Authenticator.isValid {
        ["Authorization": "Basic \(Data("\(Authenticator.email):\(Authenticator.password)".utf8).base64EncodedString())"]
      }
      else {
        throw SendError.noCredentials
      }
    }
  }
}

public extension TokenHeaderAuthenticatedRequest {
  static var authenticationHeaders: [String: String] {
    get throws {
      if Authenticator.isValid {
        ["Authorization": "Bearer \(Authenticator.token)"]
      }
      else {
        throw SendError.noCredentials
      }
    }
  }
}

@propertyWrapper
public struct AssertNotEmpry: Codable, Sendable {
  private var accessToken: String

  public var wrappedValue: String {
    get {
      accessToken
    }

    set {
      assert(!newValue.isEmpty, "accessToken is empty")

      accessToken = newValue
    }
  }

  public init(wrappedValue accessToken: String) {
    assert(!accessToken.isEmpty, "accessToken is empty")

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
