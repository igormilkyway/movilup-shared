//  Created by Igor Sorokin

public struct GetMessagesRequest: AuthenticatingServerRequest {
  public typealias Success = [MessageResponse]
  public static let url = "get_messages"

  public let chat: Chat

  public init(chat: Chat) {
    self.chat = chat
  }
}
