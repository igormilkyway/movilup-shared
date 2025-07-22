//

#if canImport(Combine)
import Combine
#else
/// A type that defines methods for encoding.
@available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
public protocol TopLevelEncoder {

  /// The type this encoder produces.
  associatedtype Output

  /// Encodes an instance of the indicated type.
  ///
  /// - Parameter value: The instance to encode.
  func encode<T>(_ value: T) throws -> Self.Output where T : Encodable
}

/// A type that defines methods for decoding.
@available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
public protocol TopLevelDecoder {

  /// The type this decoder accepts.
  associatedtype Input

  /// Decodes an instance of the indicated type.
  func decode<T>(_ type: T.Type, from: Self.Input) throws -> T where T : Decodable
}
#endif
