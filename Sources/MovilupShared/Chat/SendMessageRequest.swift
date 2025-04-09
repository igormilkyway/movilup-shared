//  Created by Igor Sorokin

public struct SendMessageRequest: TokenAuthenticatingServerRequest {
  public static let url = "send_message"

  public let message: MessageDTO

  public init(message: MessageDTO) {
    self.message = message
  }
}
