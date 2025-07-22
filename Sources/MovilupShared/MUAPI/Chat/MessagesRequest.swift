//  Created by Igor Sorokin

public struct MessagesRequest: MURequest, TokenAuthenticated {
  public typealias Success = [MessageDTO]
  
  public static let url = "messages"

  public init() { }
}
