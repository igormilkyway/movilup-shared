//  Created by Igor Sorokin

import Foundation

public protocol API {
  var baseURL: URL { get }
}

public protocol AccessTokenBaseRequest: ServerBaseRequest {
  var accessToken: String { get set }
}

public protocol SearchBoxRequest: AccessTokenBaseRequest {

}

public protocol URLable {
  static var url: String { get }
}

public protocol MethodRequest where Self: Codable & URLable {
  func urlRequest(relativeTo baseURL: URL, withToken token: String?) throws -> URLRequest
}

public protocol PostRequest: MethodRequest { }
public protocol GetRequest: MethodRequest { }
public protocol GetWithIDRequest: MethodRequest {
  var id: String { get }
}

public extension PostRequest {
  func urlRequest(relativeTo baseURL: URL, withToken token: String? = nil) throws -> URLRequest {
    var urlComponents = URLComponents(url: baseURL, resolvingAgainstBaseURL: false)!
    urlComponents.path = urlComponents.path.appending(Self.url)

    return try URLRequest(url: urlComponents.url!).with {
      $0.httpMethod = "POST"
      //      let version = "1.0.1"
      //      $0.setValue("MU/\(version) (iOS)", forHTTPHeaderField: "User-Agent")
      $0.setValue("application/json", forHTTPHeaderField: "Content-Type")
      $0.httpBody = try JSONEncoder().encode(self)
    }
  }
}

public extension GetRequest {
  func urlRequest(relativeTo baseURL: URL, withToken token: String? = nil) throws -> URLRequest {
    var urlComponents = URLComponents(url: baseURL, resolvingAgainstBaseURL: false)!
    urlComponents.path = urlComponents.path.appending(Self.url)

    //      let query = Book(title: "Winnie the Pooh", releaseYear: 1926)

    //      print("GetRequest query: \(query)")

    urlComponents.query = try QueryEncoder().with {
      $0.userInfo[.capitalizeName] = true
    }
    .encode(self)

    print("GetRequest encoded: \(urlComponents.query!)")

//    print("GetRequest decoded: \(try QueryDecoder().decode(Self.self, from: urlComponents.query!))")

    return URLRequest(url: urlComponents.url!).with {
      $0.httpMethod = "GET"
    }
  }
}

public extension GetWithIDRequest {
  func urlRequest(relativeTo baseURL: URL, withToken token: String? = nil) throws -> URLRequest {
    var urlComponents = URLComponents(url: baseURL, resolvingAgainstBaseURL: false)!
    urlComponents.path = urlComponents.path.appending(Self.url)
    urlComponents.path = urlComponents.path.appending("/\(id)")
    urlComponents.query = try QueryEncoder().encode(self)

    return URLRequest(url: urlComponents.url!).with {
      $0.httpMethod = "GET"
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
