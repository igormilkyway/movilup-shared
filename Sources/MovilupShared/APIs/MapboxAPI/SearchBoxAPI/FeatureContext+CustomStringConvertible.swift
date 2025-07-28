//

extension FeatureContext: CustomStringConvertible {
  var description: String {
    """
    \(country != nil ? "\n  country: \(country!)" : "" )\
    \(region != nil ? "\n  region: \(region!)" : "" )\
    \(address != nil ? "\n  address: \(address!)" : "" )\
    \(postcode != nil ? "\n  postcode: \(postcode!)" : "" )\
    \(district != nil ? "\n  district: \(district!)" : "" )\
    \(place != nil ?    "\n  place: \(place!)" : "" )\
    \(locality != nil ? "\n  locality: \(locality!)" : "" )\
    \(neighborhood != nil ? "\n  neighborhood: \(neighborhood!)" : "" )\
    \(street != nil ? "\n  street: \(street!)" : "" )
    """
  }
}
