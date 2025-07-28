//

extension Suggestion: CustomStringConvertible {
  public var description: String {
    """
    
    type: \(type) \(maki != nil ? "( maki: \(maki!) )" : "" )
    name: \(name) \(namePreferred != nil ? "( namePreferred: \(namePreferred!) )" : "" )
    placeFormatted: \(placeFormatted) \
    \(fullAddress != nil ? "\n  fullAddress: \(fullAddress!)" : "" ) \
    \(address != nil ? "\n  address: \(address!)" : "" )
    context:
      \(context) \
    \(other != nil ? "\n  other: \(other!)" : "" )
    """
  }

  private var other: String? {
    let other = """
    \(poiCategories != nil ? "  poiCategories: \(poiCategories!)" : "" )\
    \(poiCategoryIDs != nil ? "\n  poiCategoryIDs: \(poiCategoryIDs!)" : "" )\
    \(brands != nil ? "\n  brands: \(brands!)" : "" )\
    \(brandIDs != nil ? "\n  brandIDs: \(brandIDs!)" : "" )\
    \(externalIDs != nil ? "\n  externalIDs: \(externalIDs!)" : "" )\
    \(metadata != nil ? "\n  metadata: \(metadata!)" : "" )\
    \(addedDistance != nil ? "\n  addedDistance: \(addedDistance!)" : "" )\
    \(addedTime != nil ? "\n  brandIDs: \(addedTime!)" : "" )
    """

    if !other.isEmpty {
      return """
        
          \(other)
        """
    } else {
      return nil
    }
  }
}
