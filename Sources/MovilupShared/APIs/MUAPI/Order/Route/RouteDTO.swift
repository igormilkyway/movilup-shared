//  Created by Igor Sorokin

import struct Foundation.UUID

//public protocol RouteProtocol {
//  var from: LocationDTO { get }
//  var to: LocationDTO { get }
//  var fromTo: Distance { get }
//}

public struct RouteDTO: DTOType {
  public static let url = "route"

  public var id: UUID
  public var from: LocationDTO
  public var to: LocationDTO
  public var fromTo: Distance

  public init(id: UUID, from: LocationDTO, to: LocationDTO, fromTo: Distance) {
    self.id = id
    self.from = from
    self.to = to
    self.fromTo = fromTo
  }

  public var cost: Int {
    fromTo.cost + from.cost + to.cost
  }
}

//public struct NewRoute: RouteProtocol {
//  public var from: LocationDTO?
//  public var to: LocationDTO?
//  public var fromTo: Distance?
//}
