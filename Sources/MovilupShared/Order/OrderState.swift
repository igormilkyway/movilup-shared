//

public enum OrderState: String, Codable, Sendable {
  case created
  case estimated
  case approved
  case driverTaken
  case arrivedAtDeparture
  case loaded
  case arrivedAtDestination
  case closed
}
