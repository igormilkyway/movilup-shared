//

/// The /retrieve endpoint returns a GeoJSON FeatureCollection.
public struct SearchBoxRetrieveResponse: ServerResponse {
  /// The attribution data for results.
  private let attribution: String

  /// This will always be "FeatureCollection".
  private let type: String

  /// The returned feature objects. See the table below for details on the properties contained by each feature object.
  public let features: [Feature]
}

extension SearchBoxRetrieveResponse: CustomStringConvertible {
  public var description: String {
    """
    \(Self.self) features:
    \(features)
    """
  }
}
