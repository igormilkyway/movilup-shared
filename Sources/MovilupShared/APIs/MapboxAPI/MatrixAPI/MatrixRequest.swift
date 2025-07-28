//

import Foundation

public protocol MatrixRequest: MapboxRequest { }

public extension MatrixRequest {
  static var baseURL: URL {
    URL(string: "https://api.mapbox.com/directions-matrix/v1/")!
  }
}
