//

import Foundation

public protocol SearchBoxRequest: ServerRequest, GetRequest, TokenInBodyAuthenticated { }

extension SearchBoxRequest {
  public static var baseURL: URL {
    URL(string: "https://api.mapbox.com/search/searchbox/v1/")!
  }
}
