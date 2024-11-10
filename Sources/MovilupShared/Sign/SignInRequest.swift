//  Created by Igor Sorokin

import Foundation

public struct SignInRequest: AuthenticatingServerRequest {
  public typealias Response = MeResponse
  public typealias Error = MeError

  public static let url = "signin"
  public static let authentication: ServerRequestAuthentication = .basic

  public init() {}
}

public enum MeError: AuthenticatingRequestError {
  case processedByServer
  case resendingRequested
  case wrongCredentials

//  public var errorDescription: String? {
//    switch self {
//      case .noUserToken:
//        "Нет токена пользователя"
//      case .wrongToken:
//        "Неправильное имя пользователя или пароль"
//      case .responseStatus(let code):
//        "Ошибочный HTTP статус: \(code)"
//      case .http500:
//        "HTTP 500"
//      case .responseError:
//        "Ошибка"
//    }
//  }
}
