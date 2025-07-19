//

import Foundation

public protocol MURequest: ServerThrowingRequest, PostRequest {
  
}

extension MURequest {
  public static var baseURL: URL {
    URL(string: "https://movil-up.com/api/")!
  }
}

