//  Created by Igor Sorokin

public struct LogRequest: TokenAuthenticatingServerRequest {
  public typealias Success = LogResponse

  public static let url = "log"

  let message: String

  public init(message: String) {
    self.message = message
  }
}

public struct LogResponse: ServerSuccess {

}
