//  Created by Igor Sorokin

import Foundation

#if canImport(FoundationNetworking)
import FoundationNetworking
#endif

public protocol URLable {
  static var url: String { get }
}

public protocol PostRequest: ServerRequest { }
public protocol GetRequest: ServerRequest { }

public extension PostRequest {
  var headers: [String: String] { ["Content-Type": "application/json" ] }

  var serialized: Data {
    get throws {
      try JSONEncoder().encode(self)
    }
  }

  func urlRequest() throws -> URLRequest {
    let urlComponents = urlComponents(url: Self.baseURL)

    return try URLRequest(url: urlComponents.url!).with {
      $0.httpMethod = "POST"
      //      let version = "1.0.1"
      //      $0.setValue("MU/\(version) (iOS)", forHTTPHeaderField: "User-Agent")

      for (headerName, headerValue) in headers {
        $0.setValue(headerValue, forHTTPHeaderField: headerName)
      }

      $0.httpBody = try serialized
    }
  }
}

public extension PostRequest where Self: Authenticated {
  var headers: [String: String] {
    get throws { ["Content-Type": "application/json"].merging(try Self.authenticationHeaders) { (h, _) in h } }
  }
}

public extension GetRequest {
  var serialized: Data {
    get throws {
      let string = try QueryEncoder().with {
        $0.userInfo[.capitalizeName] = true
      }
      .encode(self)

      return Data(string.utf8)
    }
  }

  func urlRequest() throws -> URLRequest {
    var urlComponents = urlComponents(url: Self.baseURL)

    guard let query = String(data: try serialized, encoding: .utf8) else {
      fatalError()
    }

    urlComponents.query = query
//    urlComponents.queryItems?.append(URLQueryItem(name: "Name", value: "Value"))
//    print("GetRequest encoded: \(urlComponents.query!)")

    return URLRequest(url: urlComponents.url!).with {
      $0.httpMethod = "GET"

      for (headerName, headerValue) in headers {
        $0.setValue(headerValue, forHTTPHeaderField: headerName)
      }
    }
  }
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
