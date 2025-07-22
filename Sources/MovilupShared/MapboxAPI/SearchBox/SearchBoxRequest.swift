//

import Foundation

public protocol SearchBoxRequest: MapboxRequest { }

public extension SearchBoxRequest {
  static var baseURL: URL {
    URL(string: "https://api.mapbox.com/search/searchbox/v1/")!
  }

  static var countries: Set<String>? {
    var countries: Set<String> = ["IL"]

    //#if DEBUG
    countries.insert("TR")
    //#endif

#if targetEnvironment(simulator)
    countries.insert("US")
    countries.insert("RU")
#endif

    return countries
  }
}
