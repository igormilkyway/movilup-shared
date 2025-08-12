//  Created by Igor Sorokin

public struct SendMessageRequest<API: APIProtocol, Authenticator: TokenAuthenticatorProtocol>: MURequest, TokenHeaderAuthenticatedRequest {
  public typealias Success = MessageDTO

  public static var url: String { "send_message" }
  public static var roles: Set<UserRole> { .all }

  public let message: MessageDTO

  public init(message: MessageDTO) {
    self.message = message
  }
}
