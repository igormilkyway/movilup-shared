//  Created by Igor Sorokin

public struct SendMessageRequest: AuthenticatingServerRequest {
  public static let url = "send_message"

  public let chat: Chat
  public let text: String

  public init(chat: Chat, text: String) {
    self.chat = chat
    self.text = text
  }
}
