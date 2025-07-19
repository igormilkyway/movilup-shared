//  Created by Igor Sorokin

public struct SendMessageRequest: MURequest, TokenAuthenticated {
  public typealias Success = MessageDTO

  public static let url = "send_message"

  public let message: MessageDTO

  public init(message: MessageDTO) {
    self.message = message
  }
}
