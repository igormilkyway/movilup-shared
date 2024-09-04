//

public enum OrderState: String, Codable {
  case created
  case takenByEstimator
  case estimated
  case approved
  case takenByDriver
  case arrivedAtDeparture
  case loaded
  case arrivedAtDestination
  case closed
}
