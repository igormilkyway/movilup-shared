//  Created by Igor Sorokin

public struct MessagesRequest: TokenAuthenticatingServerRequest, PostRequest {  
  public typealias Success = [MessageDTO]
  
  public static let url = "messages"

  public init() { }
}
