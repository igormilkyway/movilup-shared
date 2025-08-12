//  Created by Igor Sorokin

import Foundation

public struct Distance: Codable, Sendable, Equatable {
  public let meters: Double
  public let minutes: Double
  public let isReal: Bool

  public var cost: Int {
    if meters > 0 {
      Int(meters * 0.1)
    } else {
      500
    }
  }

  public var isValid: Bool {
    meters > 0 && minutes > 0
  }

  public init() {
    self.init(meters: 0, minutes: 0, isReal: false)
  }

  public init(meters: Double, seconds: Double, isReal: Bool) {
    self.init(meters: meters, minutes: (seconds / 60).rounded(), isReal: isReal)
  }

  public init(meters: Double, minutes: Double, isReal: Bool) {
    self.meters = meters
    self.minutes = minutes
    self.isReal = isReal
  }
}

public extension Distance {
  init<TokenAuthenticator: TokenAuthenticatorProtocol>(authenticator: TokenAuthenticator.Type, from: Coordinate, to: Coordinate, verbose: Bool = false) async throws {
    guard from != to else {
      //    assert(from != to, "from != to")
      print("from != to")
      self.init(meters: 0, seconds: 0, isReal: false)
      return
    }

    let response = try await MatrixRetrieveRequest<TokenAuthenticator>(
      profile: .driving,
      coordinates: [from, to].serialized,
      annotations: "duration,distance",
      sources: [0]
    )
      .send(verbose: verbose)

    let speed = 60.0 * 1000 / (60 * 60) // km/H -> m/sec

    let elementCount = 2

    guard
      let distances = response.distances, distances[0].count == elementCount,
      let durations = response.durations, durations[0].count == elementCount
    else {
      throw SendError.invalidResponse("No distances and/or durations")
    }

    let (meters, seconds, isReal) = {
      if let meters = distances[0][1] {
        if let seconds = durations[0][1] {
          return (meters, seconds, true)
        } else {
          return (meters, meters / speed, false)
        }
      } else {
        return (0, 0, false)
      }
    }()

    self.init(meters: meters, seconds: seconds, isReal: isReal)
  }
}
