//

import Foundation

public protocol MURequest: ServerThrowingRequest, Decodable, PostRequest, RoleAuthenticatedRequest { }

//public extension MURequest {
//  static var baseURL: URL {
//    URL(string: "https://movil-up.com/api/")!
//  }
//}
