//

import struct Foundation.Date

public protocol ServerRequest: Codable {
  associatedtype Response: ServerResponse
  static var url: String { get }
//  static var authentication: Authentication { get }
  var eventDate: Date { get }
}

public protocol ServerResponse: Codable {

}

//extension ServerRequest {
//  public static var authentication: Authentication {
//    .none
//  }
//}
//
//public protocol BasicAuthentication {
//  static var authentication: Authentication { get }
//  var email: String { get }
//  var password: String { get }
//
//  init(email: String, password: String)
//}
//
//extension BasicAuthentication {
//  public static var authentication: Authentication {
//    .basic
//  }
//
//  public init(email: String, password: String) {
//
//  }
//}
//
//public protocol TokenAuthentication {
//  var authentication: Authentication { get }
//  var token: String { get }
//}
//
//extension TokenAuthentication {
//  public var authentication: Authentication {
//    .bearer
//  }
//}
