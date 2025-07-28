//

import Foundation

/// This context has layers that follow the Administrative unit types.
struct FeatureContext: Codable {
  /// The country of the result.
  let country: Country?

  /// The region of the result.
  let region: Region?

  /// The address of the result including the address number and street.
  let address: Address?

  /// The postcode of the result.
  let postcode: NamedLayer?

  /// The district of the result.
  let district: NamedLayer?

  /// The place of the result.
  let place: NamedLayer?

  /// The locality of the result.
  let locality: NamedLayer?

  /// The neighborhood of the result.
  let neighborhood: NamedLayer?

  /// The street of the result.
  let street: NamedLayer?
}

protocol ContextLayer: Codable, CustomStringConvertible {
  var id: String? { get }
  var name: String { get }
}

extension ContextLayer {
  var description: String { "\(name)" }
}

struct NamedLayer: ContextLayer {
  let id: String?
  let name: String
}

struct Country: ContextLayer {
  let id: String?
  let name: String

  /// The ISO_3166_1 alpha 2 code
  let countryCode2: String

  /// The ISO_3166_1 alpha 3 code
  let countryCode3: String

  enum CodingKeys: String, CodingKey {
    case id
    case name
    case countryCode2 = "country_code"
    case countryCode3 = "country_code_alpha_3"
  }

  var description: String { "\(name) (\(countryCode2)/\(countryCode3))" }
}

struct Region: ContextLayer {
  let id: String?
  let name: String

  let regionCode: String

  /// The ISO_3166_2 code
  let regionCodeFull: String

  enum CodingKeys: String, CodingKey {
    case id
    case name
    case regionCode = "region_code"
    case regionCodeFull = "region_code_full"
  }

  var description: String { "\(name) (\(regionCode)/\(regionCodeFull))" }
}

struct Address: ContextLayer, CustomStringConvertible {
  let id: String?
  let name: String

  let street: String
  let number: String

  enum CodingKeys: String, CodingKey {
    case id
    case name
    case number = "address_number"
    case street = "street_name"
  }

  var description: String { "\(name) (street: \(street) / number: \(number))" }
}
