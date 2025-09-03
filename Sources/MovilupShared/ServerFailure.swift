//  Created by Igor Sorokin

import protocol Foundation.LocalizedError

public protocol MUError: Error {
  var localizedDescription: String { get }
}

public protocol ServerFailure: MUError, ServerResponse {
  //  static func processedByServer(localizedDescription: String) -> Self
  static var processedByServer: Self { get }
  static var resendingRequested: Self { get }
  static func transportError(_: String) -> Self
}

public protocol AuthenticatingServerFailure: ServerFailure {
  static var wrongCredentials: Self { get }
}

public enum MeError: AuthenticatingServerFailure {
  case processedByServer
  case resendingRequested
  case wrongCredentials
  case transportError(String)

  public var localizedDescription: String {
    switch self {
      case .processedByServer:
        "The error was processed on the server"
      case .resendingRequested:
        "A resend was requested"
      case .wrongCredentials:
        "Incorrect email or password" // "Неправильное имя пользователя или пароль"
      case .transportError(let detail):
        "Transport error: \(detail)"
    }
  }
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
