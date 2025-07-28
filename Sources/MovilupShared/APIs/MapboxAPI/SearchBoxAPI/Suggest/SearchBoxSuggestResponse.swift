//

import Foundation

/// The response to a request to the /suggest endpoint is an array of JSON suggestion objects.
public struct SearchBoxSuggestResponse: ServerResponse {
  /// The attribution data for results.
  private let attribution: String

  /// The returned suggestion objects.
  public let suggestions: [Suggestion]
}

extension SearchBoxSuggestResponse: CustomStringConvertible {
  public var description: String {
    """
    \(Self.self) suggestions:
    \(suggestions)
    """
  }
}

//extension Array where Element == Suggestion {
//  var description: String {
//    """
//    \(self.map { $0.description }.joined(separator: "\n\n") )
//    
//    """
//  }
//}
