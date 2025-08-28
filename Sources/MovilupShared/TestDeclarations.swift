//

import Foundation

public protocol APIProtocol {
  static var baseURL: URL { get }
}

//public struct DefaultAPI: APIProtocol {
//  public static var baseURL: URL { .init(string: "")! }
//}

//public protocol ProtocolInAnotherModule {
//  associatedtype API: APIProtocol
//  static var api: API.Type { get }
//
//  var accessToken: String { get }
//}
//
//public extension ProtocolInAnotherModule {
////  typealias Getter = DefaultAccessTokenGetter
//  static var api: API.Type { API.self }
//}
//
//public protocol IntermediaryProtocolInAnotherModule: ProtocolInAnotherModule {}

public struct StructInAnotherModule<API: APIProtocol, Authenticator: TokenAuthenticatorProtocol>: PostRequest, TokenBodyAuthenticatedRequest {
  public typealias Response = EmptyServerResponse
//  public static var baseURL: URL { .init(string: "")! }
  public static var url: String { "" }

//  public typealias API = ConcreteAPI

//  @AssertNotEmpry public var accessToken: String = api.accessToken

  public init() {
//    print(Self.accessToken)
    print(Authenticator.token)
    print(API.baseURL)

//    print(Self.typeMethod())
//    print(instanceMethod())
  }
}

//public struct StructInThisModule: ProtocolInAnotherModule {
//  //  @AssertNotEmpry public var accessToken: String = Self.typeProperty
//
//  public init() {
//    print(Self.typeProperty)
//    print(instanceProperty)
//    print(Self.typeMethod())
//    print(instanceMethod())
//  }
//}
