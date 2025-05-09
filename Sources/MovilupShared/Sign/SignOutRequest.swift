//  Created by Igor Sorokin

public struct SignOutRequest: TokenAuthenticatingServerRequest, PostRequest {
  public static let url = "sign-out"

  public init() {}
}
