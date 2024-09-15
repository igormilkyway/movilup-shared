//  Created by Igor Sorokin

public struct UpdateDriverLocationRequest: ServerRequest {
  public typealias Response = EmptyServerResponse
  public static let url = "update-driver-location"

  public let latitude: Double
  public let longitude: Double

  public init(latitude: Double, longitude: Double) {
    self.latitude = latitude
    self.longitude = longitude
  }
}
