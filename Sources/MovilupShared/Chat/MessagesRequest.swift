//  Created by Igor Sorokin

public struct MessagesRequest: TokenAuthenticatingServerRequest {
  public typealias Success = [MessageDTO]
  
  public static let url = "messages"
}
