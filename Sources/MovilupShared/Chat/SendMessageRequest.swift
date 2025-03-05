//  Created by Igor Sorokin

public struct SendMessageRequest: TokenAuthenticatingServerRequest {
  public static let url = "send_message"

  public let chat: Chat
  public let text: String

  public init(chat: Chat, text: String) {
    self.chat = chat
    self.text = text
  }
}
