//  Created by Igor Sorokin

extension LocationDTO {
  public enum Elevator: String, Codable, Sendable {
    case none
    case passenger
    case freight
  }
}

extension LocationDTO.Elevator: CaseIterable {
  public static var allCases: [LocationDTO.Elevator] {
    [.none,
     .passenger,
     .freight]
  }
}
