//

import Foundation

public protocol MURequest: ServerThrowingRequest, Decodable, PostRequest { }

public extension MURequest {
  static var baseURL: URL {
    URL(string: "https://movil-up.com/api/")!
  }
}

