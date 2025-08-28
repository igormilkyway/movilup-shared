//  Created by Igor Sorokin

import Foundation

#if canImport(FoundationNetworking)
import FoundationNetworking
#endif

public protocol PostRequest: ServerRequest { }
public protocol GetRequest: ServerRequest { }

public extension PostRequest {
  var headers: [String: String] { ["Content-Type": "application/json" ] }

  static var method: String? { "POST" }
  var query: String? { nil }

  var _body: Data { get throws { try JSONEncoder().encode(self) } }
  var body: Data? { get throws { try _body } }
}

public extension PostRequest where Self: HeaderAuthenticatedRequest {
  var headers: [String: String] {
    get throws { ["Content-Type": "application/json"].merging(try Self.authenticationHeaders) { (h, _) in h } }
  }
}

//public protocol HeaderAuthenticatedPostRequest: PostRequest { }
//public extension HeaderAuthenticatedPostRequest where Self: HeaderAuthenticatedRequest {
//  var headers: [String: String] {
//    get throws }{ ["Content-Type": "application/json", "Test": "test" ].merging(try Self.authenticationHeaders) { (h, _) in h } }
//}

public extension PostRequest where Self: TokenBodyAuthenticatedRequest {
  var body: Data? { get throws {
    if var dict = try JSONSerialization.jsonObject(with: try _body) as? [String: Any], Authenticator.isValid {
      dict[Authenticator.name] = Authenticator.token
      return try JSONSerialization.data(withJSONObject: dict)
    } else {
      throw SendError.other("Wrong body or no authenicator")
    }
  }}
}

public extension GetRequest {
  static var method: String? { "GET" }

  var _query: String { get throws {
    try QueryEncoder().with {
      $0.userInfo[.capitalizeName] = true
    }
    .encode(self)
  }}

  var query: String? {
    get throws {
      try _query
    }
  }

  var body: Data? { nil }
}

public extension GetRequest where Self: TokenBodyAuthenticatedRequest {
  var query: String? { get throws {
    if Authenticator.isValid {
      try _query.appending("&\(Authenticator.name)=\(Authenticator.token)")
    } else {
      throw SendError.other("Query: no authenicator")
    }
  }}
}


extension CharacterSet {
  func asArray() -> [Unicode.Scalar] {
    var array = [Unicode.Scalar]()
    for codePoint in (0 as UInt32) ... 0x10FFFF {
      if let scalar = Unicode.Scalar(codePoint),
         self.contains(scalar) {
        array.append(scalar)
      }
    }
    return array
  }

  func print() {
    for scalar in self.asArray() {
      Swift.print("\(scalar) (U+\(String(scalar.value, radix: 16, uppercase: true)))")
    }
  }
}
