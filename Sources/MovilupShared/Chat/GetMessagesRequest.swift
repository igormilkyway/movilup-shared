//  Created by Igor Sorokin

public struct GetMessagesRequest: TokenAuthenticatingServerRequest {
  public typealias Success = [MessageDTO]
  public static let url = "get_messages"
}
