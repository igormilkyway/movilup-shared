//

import Foundation

struct Metadata: Codable, CustomStringConvertible {
  let openHours: OpenHours?

  enum CodingKeys: String, CodingKey {
    case openHours = "open_hours"
  }

  var description: String {
    """
    \(openHours != nil ? "\n  openHours: \(openHours!)" : "" )
    """
  }

  init(from decoder: any Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)

    self.openHours = try container.decodeIfPresent(OpenHours.self, forKey: .openHours)
  }
}

struct OpenHours: Codable, CustomStringConvertible {
  let periods: [Period]

  var description: String {
    """
    
      periods:
    \(periods.map { "  \($0)\n" }.joined() )
    """
  }
}

struct Period: Codable, CustomStringConvertible {
  let open: Open

  var description: String {
    """
    open: \(open)
    """
  }
}

struct Open: Codable, CustomStringConvertible {
  let day: Int

  var description: String {
    Calendar.current.with {
      $0.locale = Locale.autoupdatingCurrent
    }
    .weekdaySymbols[day]
  }
}
