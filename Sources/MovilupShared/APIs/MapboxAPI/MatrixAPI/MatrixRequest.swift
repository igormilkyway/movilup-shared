//

import Foundation

public protocol MatrixRequest: MapboxRequest where API == MatrixAPI { }

public struct MatrixAPI: APIProtocol {
  public static var baseURL: URL { .init(string: "https://api.mapbox.com/directions-matrix/v1/")! }
}
