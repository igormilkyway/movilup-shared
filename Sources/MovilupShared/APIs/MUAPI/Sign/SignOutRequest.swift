//  Created by Igor Sorokin

public struct SignOutRequest: MURequest, TokenAuthenticated {  
  public static let url = "sign-out"

  public init() {}
}
